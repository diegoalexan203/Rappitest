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

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    func bind() {
//        formalitiesViewModel.input.token.accept(sesion?.token)
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
//        formalitiesUiTableView.rx.setDelegate(self).disposed(by: disposeBag)
//        formalitiesUiTableView.rx.setDataSource(self).disposed(by: disposeBag)
    }

}
