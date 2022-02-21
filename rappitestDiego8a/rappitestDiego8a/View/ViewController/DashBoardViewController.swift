//
//  DashBoardViewController.swift
//  rappitestDiego8a
//
//  Created by Periferia on 31/01/22.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class DashBoardViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    let dashBoardViewModel = DashBoardViewModel()
    var arrMovies : [MoviesEntity] = []

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        collectionView.register(OptionViewCell.nib(), forCellWithReuseIdentifier: OptionViewCell.identifier)//(OptionViewCell.self, forCellReuseIdentifier: OptionViewCell.identifier)
        bind()
    }

    func bind() {
        dashBoardViewModel.input.page.accept("1")
        dashBoardViewModel.output.movies.subscribe(onNext: {
            response in
                 self.arrMovies = response ?? []
                self.collectionView.reloadData()
            
//            self.output.isLoading.accept(true)
//                       let categoryFake = self.addCategoryfake()
//            var list = response.Categorias
//            list?.append(categoryFake)
            //self.output.categories.accept(list)
        },
        onError: { responseError in
           // let statusCodeMoya = ConverterErrorMoya().converStatusCodeErrorCodeMoya(error: responseError as NSError)
//            self.output.isLoading.accept(false)
//            self.output.codeResponse.accept(statusCodeMoya)
    }
    ).disposed(by: disposeBag)
//        formalitiesViewModel.output.categories.subscribe(
//            onNext: { cate in
//                if cate != nil {
//                    if cate!.count > 0 {
//                        self.showDataCategorysOrEmpty()
//                    }
//                }
//
//        }).disposed(by: disposeBag)
//
//        formalitiesViewModel.output.codeResponse.subscribe(
//            onNext: { code in
//                if code != nil {
//                    self.hideProgressIndicator()
//                    self.showMessageByErrorCode(codeError: code!, context: "two")
//                }
//            }
//        ).disposed(by: disposeBag)
        collectionView.rx.setDelegate(self).disposed(by: disposeBag)
        collectionView.rx.setDataSource(self).disposed(by: disposeBag)
    }

}

