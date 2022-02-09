//
//  AnimalListTableViewCell.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/2/9.
//

import UIKit

// MARK: - NibInstantiable

extension AnimalListTableViewCell: NibInstantiable {}



class AnimalListTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var animalImageView: UIImageView!
    
    @IBOutlet weak var genderImageView: UIImageView!
    
    @IBOutlet weak var bacterinImageView: UIImageView!
    
    @IBOutlet weak var sterilizationImagView: UIImageView!
    
    // MARK: - Properties
    
    static let height: CGFloat = 150
    
    // MARK: - Init

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
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
