//
//  AnimalDetailHeaderView.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/11.
//

import UIKit
import SDWebImage


// MARK: - UIViewInstantiable

extension AnimalDetailHeaderView: UIViewInstantiable {}

class AnimalDetailHeaderView: UIView {
    
    static let height: CGFloat = 250
    
    @IBOutlet weak var animalImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func set(info: Animal) {
        guard let url = URL(string: info.urlImage!) else { return }
        animalImageView.sd_setImage(with: url) { _, error, _, _ in
            if let _ = error {
                print("失敗")
            }
        }
    }
    
    
}
