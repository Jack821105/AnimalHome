//
//  AnimalCollectionReusableView.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/14.
//

import UIKit


protocol AnimalCollectionReusableViewDelegate: AnyObject {
    
    func didTapAnimalType(animalType: AnimalViewController.AnimalType)
    
    
    
}


// MARK: - NibInstantiable


extension AnimalCollectionReusableView: NibInstantiable {}

class AnimalCollectionReusableView: UICollectionReusableView {
    
    
    weak var delegate: AnimalCollectionReusableViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    @IBAction func didTapDogButton(_ sender: Any) {
        delegate?.didTapAnimalType(animalType: .dog)
    }
    
    @IBAction func didTapCatButton(_ sender: Any) {
        delegate?.didTapAnimalType(animalType: .cat)
    }
    
    
}
