//
//  AnimalHeaderView.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/8.
//

import UIKit
import SDWebImage

// MARK: - Protocol

protocol AnimalHeaderViewDelegate: AnyObject {
    
    func didClickHeaderButton(currentType: AnimalViewController.AnimalType)
    
}



// MARK: - UIViewInstantiable

extension AnimalHeaderView: UIViewInstantiable {}

class AnimalHeaderView: UIView {

    
    private var currentType: AnimalViewController.AnimalType = .dog
    
    weak var delegate: AnimalHeaderViewDelegate?
    
    // MARK: - Init
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    @IBAction func didClickDogButton(_ sender: Any) {
        currentType = .dog
        delegate?.didClickHeaderButton(currentType: currentType)
    }
    
    @IBAction func didClickCatButton(_ sender: Any) {
        currentType = .cat
        delegate?.didClickHeaderButton(currentType: currentType)
    }
}
