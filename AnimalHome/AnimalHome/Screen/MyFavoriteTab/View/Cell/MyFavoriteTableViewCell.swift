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
    }
    
    
}
