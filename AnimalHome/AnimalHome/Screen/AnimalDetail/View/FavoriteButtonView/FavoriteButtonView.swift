//
//  FavoriteButtonView.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/2/26.
//

import UIKit

 // MARK: - Protocol
protocol FavoriteButtonViewDelegate: AnyObject {
    
    func didTapFavoriteButton(hadAddMyFavorite: Bool)
    
}


// MARK: - UIViewInstantiable

extension FavoriteButtonView: UIViewInstantiable {}


class FavoriteButtonView: UIView {
    
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var heartImageView: UIImageView!
    
    
    weak var delegate: FavoriteButtonViewDelegate?
    
    
    
    // MARK: - Init
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - IBAction
    
    @IBAction func didTapHeartView(_ sender: UIButton) {
        
        var imageName: String = ""
        
        if !sender.isSelected {
            sender.isSelected = true
            imageName = "heart.fill"
        } else {
            sender.isSelected = false
            imageName = "heart"
        }
        
        heartImageView.image = UIImage(systemName: imageName)
        
        delegate?.didTapFavoriteButton(hadAddMyFavorite: sender.isSelected)
        
    }
}
