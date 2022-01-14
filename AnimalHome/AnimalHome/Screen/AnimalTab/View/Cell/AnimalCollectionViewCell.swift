//
//  AnimalCollectionViewCell.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/14.
//

import UIKit
import SDWebImage


// MARK: - NibInstantiable

extension AnimalCollectionViewCell: NibInstantiable {}

class AnimalCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var animalImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    
    func set(info: Animal) {
        
        animalImageView.sd_setImage(with: URL(string: info.urlImage!)) { _, error, _, _ in
            if let _ = error {
                self.animalImageView.image = UIImage(named: "cat-animal")
            }
            
        }
    }
    
}
