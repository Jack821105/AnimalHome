//
//  AnimalTableViewCell.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/8.
//

import UIKit
import SDWebImage


// MARK: - NibInstantiable

extension AnimalTableViewCell: NibInstantiable {}


class AnimalTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    
    /// 動物圖
    @IBOutlet weak var animalImageView: UIImageView!
    
    /// 性別
    @IBOutlet weak var sexLabel: UILabel!
    
    /// 顏色
    @IBOutlet weak var colorLabel: UILabel!
    
    
    // MARK: - Init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        clearUI()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    private func clearUI() {
        sexLabel.text = ""
        colorLabel.text = ""
    }
    
    func set(info: Animal) {
        
        
        if let sex = info.sex {
            sexLabel.text = "性別: \(sex.getTitle())"
            sexLabel.textColor = .white
            sexLabel.isEnabled = false
        } else {
            sexLabel.isEnabled = true
        }

        if let color = info.colour {
            colorLabel.isEnabled = false
            colorLabel.text = "顏色: \(color)"
            colorLabel.textColor = .white
        }
        animalImageView.sd_setImage(with: URL(string: info.urlImage!))
        
    }
    
    
    
}
