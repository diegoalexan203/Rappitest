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
    
    struct Input {
         var page = BehaviorRelay<String?>(value: nil)
    }

    struct Output {
//        var categories = BehaviorRelay<[Category]?>(value: nil)
        var isLoading = BehaviorRelay<Bool>(value: false)
//        var isSuccesful = BehaviorRelay<Bool>(value: false)
//        var message = BehaviorRelay<(String?, String?)>(value: (nil, nil))
//        var codeResponse = BehaviorRelay<Int?>(value: nil)
//        var idService = BehaviorRelay<String?>(value: nil)
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
            //self.getMovies(page: self.input.page.value ?? "" )
            self.getMovies()
        }}).disposed(by: disposeBag)
    }
}
