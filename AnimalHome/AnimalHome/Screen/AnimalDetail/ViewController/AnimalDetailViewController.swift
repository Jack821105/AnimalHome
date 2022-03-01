//
//  AnimalDetailViewController.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/9.
//

import UIKit
import SnapKit
import SDWebImage
import FirebaseRemoteConfig

// MARK: - StoryboardInstantiable

extension AnimalDetailViewController: StoryboardInstantiable {}

class AnimalDetailViewController: UIViewController {
    
    
    // MARK: - UI Properties
    
    private lazy var tabelView: UITableView = {
        let view = UITableView()
        view.separatorStyle = .none
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var favoriteButtonView: FavoriteButtonView = {
        let view = FavoriteButtonView.instantiate()
        view.delegate = self
        return view
    }()
    
    
    private lazy var bigHeadeImageView: AnimalDetailHeaderView = {
        let view = AnimalDetailHeaderView.instantiate()
        return view
    }()
    
    
    // MARK: - Properties
    
    private var info: Animal?
    
    private lazy var viewModel: AnimalDetailViewModel = {
        return AnimalDetailViewModel()
    }()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupUI()
        register()
        setupTableView()
    }
    
    
    func setInfo(info: Animal) {
        self.bigHeadeImageView.set(info: info)
        self.info = info
    }
    
    
    private func setupUI() {
        
        self.view.addSubview(bigHeadeImageView)
        bigHeadeImageView.translatesAutoresizingMaskIntoConstraints = false
        self.bigHeadeImageView.snp.makeConstraints {
            $0.left.top.right.equalTo(self.view).offset(0)
            $0.height.lessThanOrEqualTo(AnimalDetailHeaderView.height)
        }
        
        
        self.view.addSubview(tabelView)
        tabelView.snp.makeConstraints {
            $0.top.equalTo(self.bigHeadeImageView.snp.bottom).offset(0)
            $0.left.right.bottom.equalTo(self.view).offset(0)
        }
    }
    
    private func register() {
        let nib = UINib(nibName: AnimalDetailTableViewCell.nibName, bundle: nil)
        tabelView.register(nib, forCellReuseIdentifier: AnimalDetailTableViewCell.nibName)
    }
    
    private func setupTableView() {
        tabelView.delegate = self
        tabelView.dataSource = self
    }
    
    private func setupNavigation() {
        navigationItem.title = "浪浪自我介紹"
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: favoriteButtonView)
        
    }
    
    
    
}

// MARK: - UITableViewDelegate

extension AnimalDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

// MARK: - UITableViewDataSource

extension AnimalDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AnimalDetailTableViewCell.nibName, for: indexPath) as! AnimalDetailTableViewCell
        let title = getTitle(index: indexPath.row)
        let detail = getDetail(index: indexPath.row)
        cell.set(title: title, detail: detail)
        return cell
    }
    
    private func getTitle(index: Int) -> String? {
        switch index {
        case 0:
            return "晶片"
        case 1:
            return "性別"
        case 2:
            return "體型"
        case 3:
            return "顏色"
        case 4:
            return "施打狂犬病疫苗"
        case 5:
            return "是否絕育"
        case 6:
            return "發現地"
        case 7:
            return "收容所名稱"
        case 8:
            return "容所地址"
        case 9:
            return "收容所電話"
        case 10:
            return "資料備註"
        default:
            return nil
        }
    }
    
    private func getDetail(index: Int) -> String? {
        switch index {
        case 0:
            if let id = info?.id {
                return String("\(id)")
            } else {
                return "-"
            }
        case 1:
            return info?.sex?.getTitle()
        case 2:
            return info?.bodytype?.getTitle()
        case 3:
            return info?.colour
        case 4:
            return info?.bacterin?.getTitle()
        case 5:
            return info?.sterilization?.getTitle()
        case 6:
            return info?.foundplace
        case 7:
            return info?.shelterName
        case 8:
            return info?.shelterAddress
        case 9:
            return info?.shelterTel
        case 10:
            return info?.remark
        default:
            return nil
        }
    }
    
    
}


// MARK: - FavoriteButtonViewDelegate
extension AnimalDetailViewController: FavoriteButtonViewDelegate {
    func didTapFavoriteButton(hadAddMyFavorite: Bool) {
        guard var info = info else { return }
        info.hadAddMyFavorite = hadAddMyFavorite
        viewModel.writeData(info: info)
    }
}
