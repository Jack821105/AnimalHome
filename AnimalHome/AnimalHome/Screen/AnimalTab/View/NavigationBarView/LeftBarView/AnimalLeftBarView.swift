//
//  AnimalLeftBarView.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/12.
//

import UIKit

// MARK: - UIViewInstantiable

extension AnimalLeftBarView: UIViewInstantiable {}

class AnimalLeftBarView: UIView {
    
    @IBOutlet weak var totalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        totalLabel.text = "0"
    }
    
    func set(total: Int) {
        totalLabel.text = String(total)
    }
    
}
