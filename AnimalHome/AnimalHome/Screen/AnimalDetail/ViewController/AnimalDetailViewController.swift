//
//  AnimalDetailViewController.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/9.
//

import UIKit
import SnapKit
import SDWebImage


// MARK: - StoryboardInstantiable

extension AnimalDetailViewController: StoryboardInstantiable {}

class AnimalDetailViewController: UIViewController {

    
    private lazy var animalImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
     
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    
    func setInfo(info: Animal) {
        animalImageView.sd_setImage(with: URL(string: info.urlImage!)) { _, error, _, _ in
            if let _ = error {
                DispatchQueue.main.async {
                    self.animalImageView.image = UIImage(systemName: "xmark.app")
                }
            }
        }
    }
    
    
    private func setupUI() {
        
        self.view.addSubview(animalImageView)
        animalImageView.snp.makeConstraints {
            $0.top.left.right.equalTo(self.view)
            $0.height.equalTo(300)
            
        }
        
    }


}
