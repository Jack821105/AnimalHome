//
//  MyFavoriteTableViewCell.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/23.
//

import UIKit

// MARK: - NibInstantiable

extension MyFavoriteTableViewCell: NibInstantiable {}

class MyFavoriteTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
