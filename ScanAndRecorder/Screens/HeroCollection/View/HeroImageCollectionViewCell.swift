//
//  HeroImageCollectionViewCell.swift
//  ScanAndRecorder
//
//  Created by Margarita Chernyaeva on 1.10.21.
//

import UIKit
import SDWebImage

class HeroImageCollectionViewCell: UICollectionViewCell {

    // MARK: - @IBOutlets
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Public Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "HeroImageCollectionViewCell", bundle: nil)
    }
    
    func configure(with url: URL?, name: String?) {
        heroImageView.sd_setImage(with: url, placeholderImage: R.image.icon_default_hero())
        nameLabel.text = name
    }
}
