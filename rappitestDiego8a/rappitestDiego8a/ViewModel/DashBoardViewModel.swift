//
//  DashBoardViewModel.swift
//  rappitestDiego8a
//
//  Created by Periferia on 31/01/22.
//

import Foundation
import RxSwift
import Moya
import Alamofire
import RxCocoa

class DashBoardViewModel: ViewModelProtocol {
    
    let disposeBag = DisposeBag()
    var moviesBusinessLogic: MoviesBusinessLogic
    var moviesList = [MoviesEntity]()

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
        self.input.page.subscribe(
        onNext: { page in
        if page != nil {
            // self.getMovies(page: self.input.page.value ?? "" )
            do {
                try self.moviesBusinessLogic.getMovies(page: page!).asObservable().retry(1)
                    .subscribe(onNext: { response in
                        let users = response
                        self.output.movies.accept(response.results)
//                        for user in users {
//                            self.usersDB.create(user: user)
//                        }
//                        self.showUsers()
                    })
            } catch {
                print("Error", "No se pudo cargar el servicio")
            }
        }}).disposed(by: disposeBag)
    }
}
