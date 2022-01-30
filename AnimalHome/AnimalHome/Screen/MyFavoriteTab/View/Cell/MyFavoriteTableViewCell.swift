//
//  MyFavoriteTableViewCell.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/23.
//

import UIKit
import SDWebImage

// MARK: - NibInstantiable

extension MyFavoriteTableViewCell: NibInstantiable {}

class MyFavoriteTableViewCell: UITableViewCell {

    
    static let height: CGFloat = 120.0
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var animalImageView: UIImageView!
    
    @IBOutlet weak var genderImageView: UIImageView!
    
    @IBOutlet weak var bacterinImageView: UIImageView!
    
    @IBOutlet weak var sterilizationImagView: UIImageView!
    
    // MARK: - Init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func set(info: Animal) {

        animalImageView.sd_setImage(with: URL(string: info.urlImage!)) { _, error, _, _ in
            if let _ = error {
                self.animalImageView.image = UIImage(named: "cat-animal")
            }
        }
        
        if let gender = info.sex {
            var imageName: String
            switch gender {
            case .f:
                imageName = "gender_F"
            case .m:
                imageName = "gender_M"
            case .nono:
                imageName = "gender_None"
            }
            self.genderImageView.image = UIImage(named: imageName)
        }
        
        if let bacterin = info.bacterin {
            var imageName: String
            if bacterin.rawValue == "T" {
                imageName = "graphicRoundCheck"
            } else {
                imageName = "img_slider_normal"
            }
            self.bacterinImageView.image = UIImage(named: imageName)
        }
        
        if let sterilization = info.sterilization {
            var imageName: String
            if sterilization.rawValue == "T" {
                imageName = "graphicRoundCheck"
            } else {
                imageName = "img_slider_normal"
            }
            self.sterilizationImagView.image = UIImage(named: imageName)
        }
    }
    
    
}
