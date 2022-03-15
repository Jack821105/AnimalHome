//
//  CatListViewController.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/2/9.
//

import UIKit
import SnapKit

// MARK: - StoryboardInstantiable

extension CatListViewController: StoryboardInstantiable {}

class CatListViewController: UIViewController {

    // MARK: - UI Properties
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .black34Color
        view.separatorStyle = .none
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    // MARK: - Properties
    
    private lazy var viewModel: CatListViewModel = {
        let viewModel = CatListViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchAPI()
        setupUI()
        register()
        setupTableView()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        self.view.addSubview(self.tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(self.view).offset(0)
        }
    }
    
    private func register() {
        let nib = UINib(nibName: AnimalListTableViewCell.nibName, bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: AnimalListTableViewCell.nibName)
    }
    
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
}

// MARK: - UITableViewDelegate

extension CatListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return AnimalListTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = AnimalDetailViewController.instantiate()
        let info = viewModel.infos[indexPath.row]
        vc.setInfo(info: info)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: - UITableViewDataSource

extension CatListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let infos = viewModel.infos
        return infos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: AnimalListTableViewCell.nibName, for: indexPath) as! AnimalListTableViewCell
        let info = viewModel.infos[indexPath.row]
        cell.set(info: info)
        return cell
    }
    
}

// MARK: - CatListViewModelDelegate

extension CatListViewController: CatListViewModelDelegate {
    func updateInfo() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
