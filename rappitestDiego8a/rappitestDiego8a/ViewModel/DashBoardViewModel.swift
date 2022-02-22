//
//  DashBoardViewModel.swift
//  rappitestDiego8a
//
//  Created by Diego Ochoa on 31/01/22.
//

import Alamofire
import Foundation
import Moya
import Reachability
import RxCocoa
import RxSwift

class DashBoardViewModel: ViewModelProtocol {
    let disposeBag = DisposeBag()
    var moviesBusinessLogic: MoviesBusinessLogic
    var moviesList = [MoviesEntity]()
    let moviesDB = DbHelper()
    let network = NetworkManager.sharedInstance

    struct Input {
        var page = BehaviorRelay<String?>(value: nil)
    }

    struct Output {
        var movies = BehaviorRelay<[MoviesEntity]?>(value: nil)
        var isLoading = BehaviorRelay<Bool>(value: false)
    }

    let input: Input
    let output: Output

    init() {
        input = Input()
        output = Output()
        moviesBusinessLogic = MoviesBusinessLogic(repository: MoviesRepository())
        getMovies()
    }

    init(moviesBusinessLogic: MoviesBusinessLogic) {
        input = Input()
        output = Output()
        self.moviesBusinessLogic = moviesBusinessLogic
        getMovies()
    }

    func getMovies() {
        network.reachability.whenReachable = { _ in
            self.input.page.subscribe(
                onNext: { page in
                    if page != nil {
                        self.output.isLoading.accept(true)
                        do {
                            try self.moviesBusinessLogic.getMovies(page: page!).asObservable().retry(1)
                                .subscribe(onNext: { response in
                                    for movie in response.results {
                                        let movi = self.moviesDB.getMovieById(idMovie: movie.id!)
                                        if movi == nil {
                                            self.moviesDB.create(movies: movie)
                                        }
                                    }
                                    self.showMovies()
                                })
                        } catch {
                            print("Error", "No se pudo cargar el servicio")
                        }
                    }
                }).disposed(by: self.disposeBag)
        }
        network.reachability.whenUnreachable = { _ in
            self.showMovies()
        }
    }

    func showMovies() {
        output.movies.accept(moviesDB.getMoviesList())
        output.isLoading.accept(false)
    }
}
