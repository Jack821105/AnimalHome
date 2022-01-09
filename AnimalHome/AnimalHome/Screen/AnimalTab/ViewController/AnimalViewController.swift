//
//  AnimalViewController.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/2.
//

import UIKit
import SnapKit

// MARK: - StoryboardInstantiable

extension AnimalViewController: StoryboardInstantiable {}

/// 動物主頁
class AnimalViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.separatorStyle = .none
        return view
    }()
    
    private lazy var headerView: AnimalHeaderView = {
        let view = AnimalHeaderView.instantiate()
        view.delegate = self
        return view
    }()
    
    private lazy var viewModel: AnimalViewModel = {
        let viewModel = AnimalViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        register()
        setupUI()
        setupTableView()
        viewModel.featchAPI()
    }
    
    // MARK: - SetupUI
    
    private func setupUI() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.left.top.right.bottom.equalTo(self.view).offset(0)
        }
    }
    
    // MARK: - Func
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func register() {
        let nib = UINib(nibName: AnimalTableViewCell.nibName, bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: AnimalTableViewCell.nibName)
    }
    
    
}

// MARK: - 擴充區

extension AnimalViewController {
    
    enum AnimalType {
        
        case dog
        
        case cat
    }
    
}


// MARK: - UITableViewDelegate

extension AnimalViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return headerView
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 30
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let infos = viewModel.getCurrntTypeInfos()
        let info = infos[indexPath.row]
        let vc = AnimalDetailViewController.instantiate()
        vc.setInfo(info: info)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: - UITableViewDataSource

extension AnimalViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let infos = viewModel.getCurrntTypeInfos()
        return infos.isEmpty ? 0 : infos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AnimalTableViewCell.nibName, for: indexPath) as! AnimalTableViewCell
        let infos = viewModel.getCurrntTypeInfos()
        let info = infos[indexPath.row]
        cell.set(info: info)
        return cell
    }
    
    
}


// MARK: - AnimalViewModelDelegate

extension AnimalViewController: AnimalViewModelDelegate {
    
    func updateInfo() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}


// MARK: - AnimalHeaderViewDelegate

extension AnimalViewController: AnimalHeaderViewDelegate {
    
    func didClickHeaderButton(currentType: AnimalType) {
        DispatchQueue.main.async {
            self.viewModel.currentType = currentType
            self.tableView.reloadData()
        }
    }
    
}

