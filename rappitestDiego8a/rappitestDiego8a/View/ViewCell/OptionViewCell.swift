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

    @IBOutlet var movieLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBOutlet var movieImgeView: UIImageView!

    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
