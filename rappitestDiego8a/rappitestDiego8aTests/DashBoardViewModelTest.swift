//
//  DashBoardViewModelTest.swift
//  rappitestDiego8aTests
//
//  Created by Diego Ochoa on 22/02/22.
//

import Foundation
import RxCocoa
import RxSwift
import RxTest
import XCTest
@testable import rappitestDiego8a


class DashBoardViewModelTest: XCTestCase {
    var scheduler: TestScheduler!
    var disposebag: DisposeBag!

    override func setUp() {
        scheduler = TestScheduler(initialClock: 0)
        disposebag = DisposeBag()
    }


    func testGetMovie() {
        let fake = FakeMoviesBL()
        let viewModel = DashBoardViewModel(moviesBusinessLogic: fake)
        
        viewModel.input.page.accept("1")
        
        let movies = scheduler.createObserver([MoviesEntity]?.self)
        viewModel.output.movies.asDriver().drive(movies).disposed(by: disposebag)
        
        scheduler.start()
        let response = viewModel.output.movies
        XCTAssertNotNil(response)

        
    }
}


