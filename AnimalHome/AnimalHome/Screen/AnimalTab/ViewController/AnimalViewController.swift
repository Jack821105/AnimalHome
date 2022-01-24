//
//  AnimalViewController.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/2.
//

import UIKit
import SnapKit
import FirebaseRemoteConfig

// MARK: - StoryboardInstantiable

extension AnimalViewController: StoryboardInstantiable {}

/// 動物主頁
class AnimalViewController: UIViewController {
    
    private lazy var leftBarView: AnimalLeftBarView = {
        let view = AnimalLeftBarView.instantiate()
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        view.backgroundColor = .clear
        return view
    }()
    
    
    private lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        layout.sectionHeadersPinToVisibleBounds = true
        return layout
    }()
    
    private lazy var viewModel: AnimalViewModel = {
        let viewModel = AnimalViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "浪浪之家"
        self.view.backgroundColor = .black34Color
        setupNavigation()
        register()
        setupUI()
        setupCollectionView()
        viewModel.featchAPI()
        
    }
    
    // MARK: - SetupUI
    
    private func setupNavigation() {
        leftBarView.translatesAutoresizingMaskIntoConstraints = false
        leftBarView.snp.makeConstraints {
            $0.width.greaterThanOrEqualTo(110)
            $0.height.greaterThanOrEqualTo(30)
        }
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBarView)
    }
    
    private func setupUI() {
        self.view.addSubview(collectionView)
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(self.view).offset(0)
        }
        
    }
    
    // MARK: - Func
    
    private func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    private func register() {
        
        let nib2 = UINib(nibName: AnimalCollectionReusableView.nibName, bundle: nil)
        self.collectionView.register(nib2, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AnimalCollectionReusableView.nibName)
        
        let nib3 = UINib(nibName: AnimalListCollectionViewCell.nibName, bundle: nil)
        self.collectionView.register(nib3, forCellWithReuseIdentifier: AnimalListCollectionViewCell.nibName)
    }
    
    
}

// MARK: - 擴充區

extension AnimalViewController {
    
    enum AnimalType {
        
        case dog
        
        case cat
    }
    
}

// MARK: - AnimalViewModelDelegate

extension AnimalViewController: AnimalViewModelDelegate {
    
    func updateInfo() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            let infos = self.viewModel.getCurrntTypeInfos()
            self.leftBarView.set(total: infos.count)
        }
    }
    
}

// MARK: - UICollectionViewDelegate

extension AnimalViewController: UICollectionViewDelegate {
    
    
    /// Header
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return section == 0 ? CGSize(width: collectionView.frame.width, height: 50) : .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader,
           let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AnimalCollectionReusableView.nibName, for: indexPath) as? AnimalCollectionReusableView {
            headerView.delegate = self
            return headerView
        }
        
        return UICollectionReusableView()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let infos = self.viewModel.getCurrntTypeInfos()
        let info = infos[indexPath.row]
        let vc = AnimalDetailViewController.instantiate()
        vc.setInfo(info: info)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension AnimalViewController: UICollectionViewDelegateFlowLayout {
    
    /// collectionView單元格尺寸
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.bounds.width, height: 120)
    }
    
}

// MARK: - UICollectionViewDataSource

extension AnimalViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let infos = viewModel.getCurrntTypeInfos()
        return infos.isEmpty ? 0 : infos.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let infos = viewModel.getCurrntTypeInfos()
        let info = infos[indexPath.row]
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnimalListCollectionViewCell.nibName, for: indexPath) as! AnimalListCollectionViewCell
        cell.delegate = self
        cell.set(info: info)
        
        return cell
    }
    
    
}


// MARK: - AnimalCollectionReusableViewDelegate

extension AnimalViewController: AnimalCollectionReusableViewDelegate {
    
    func didTapAnimalType(animalType: AnimalType) {
        DispatchQueue.main.async {
            self.viewModel.currentAnimalType = animalType
            self.leftBarView.set(total: self.viewModel.getCurrntTypeInfos().count)
            self.collectionView.reloadData()
        }
    }
    
    
}


// MARK: - AnimalListCollectionViewCellDelegate

extension AnimalViewController: AnimalListCollectionViewCellDelegate {
    
    func addMyFavorite(info: Animal) {
        var infos = MyFavoriteManager.shared.readData()
        infos.append(info)
        MyFavoriteManager.shared.writeData(saveDate: infos)
    }
    
}
