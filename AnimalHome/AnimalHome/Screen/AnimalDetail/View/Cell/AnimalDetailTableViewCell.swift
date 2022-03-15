//
//  AnimalDetailTableViewCell.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/11.
//

import UIKit

// MARK: - NibInstantiable
extension AnimalDetailTableViewCell: NibInstantiable {}


class AnimalDetailTableViewCell: UITableViewCell {

    /// 標題
    @IBOutlet weak var titleLabel: UILabel!
    
    /// 內容
    @IBOutlet weak var detailLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(title: String?, detail: String?) {
        if let title = title {
            titleLabel.text = title
        }
        
        if let detail = detail {
            detailLabel.text = detail
        } else {
            detailLabel.text = "-"
        }
        
        
    }
    
    
}
