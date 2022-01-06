//
//  AnimalTableViewCell.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/2.
//

import UIKit
import SnapKit

class AnimalTableViewCell: UITableViewCell {
    
    
    private lazy var title: UILabel = {
        return UILabel()
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupUI() {
        self.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.snp.makeConstraints {
            $0.centerX.centerY.equalTo(self)
            $0.height.equalTo(self).offset(10)
        }
    }
    
    func set(info: Animal) {
        title.text = info.age
        title.textColor = .green
    }

}
