//
//  OptionViewCell.swift
//  rappitestDiego8a
//
//  Created by Diego on 2/02/22.
//

import Foundation
import UIKit

class OptionViewCell: UICollectionViewCell {
        
    static let identifier = "OptionViewCell"
    public static var url: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
//    override init(frame: CGRect) {
//      super.init(frame: frame)
//        self.nib
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override class func awakeFromNib() {
//        movieImgeView.load(urlString: self.url)
//    }
    
    @IBOutlet weak var movieImgeView: UIImageView!
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
//    func setup() {
//       // let view = loadViewFromNib()
//        view.frame = bounds
//        addSubview(view)
//    }

//    func loadViewFromNib() -> UIView {
//        let bundle = Bundle(for: type(of: self))
//        let nib = UINib(nibName: "MovieCollectionCell", bundle: bundle)
//        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
//    return view
//    }

//    private func loadViewFromNib() -> UIView {
//          let bundle = Bundle(for: type(of: self))
//        let nib = UINib(nibName: type(of: self).description().replacingOccurrences(of: self.description, with: ""), bundle: bundle)
//          let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
//
//          return nibView
//      }
}
