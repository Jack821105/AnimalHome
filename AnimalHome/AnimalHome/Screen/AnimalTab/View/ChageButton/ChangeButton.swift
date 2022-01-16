//
//  ChangeButton.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/15.
//

import UIKit

protocol ChangeButtonDelegate: AnyObject {
    
    func didChageCollectionViewCellType(cellType: AnimalViewController.CellType)
    
}


// MARK: - UIViewInstantiable

extension ChangeButton: UIViewInstantiable {}

class ChangeButton: UIView {
    
    
    @IBOutlet weak var cellTypeImageView: UIImageView!
    
    weak var delegate: ChangeButtonDelegate?
    
    
    // MARK: - Init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    @IBAction func didChage(_ sender: UIButton) {
        
        var cellType: AnimalViewController.CellType
        sender.tintColor = .clear
        if !sender.isSelected {
            sender.isSelected = true
            self.cellTypeImageView.image = UIImage(named: "icon_float_field")
            cellType = .list
        } else {
            cellTypeImageView.image = UIImage(named: "icon_float_list")
            cellType = .photo
            sender.isSelected = false
            
        }
        delegate?.didChageCollectionViewCellType(cellType: cellType)
    }
}
