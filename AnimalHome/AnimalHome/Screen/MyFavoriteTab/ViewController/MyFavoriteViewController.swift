//
//  MyFavoriteViewController.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/23.
//

import UIKit

// MAKR: - StoryboardInstantiable

extension MyFavoriteViewController: StoryboardInstantiable {}

class MyFavoriteViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    private lazy var viewModel: MyFavoriteViewModel = {
        let model = MyFavoriteViewModel()
        return model
    }()
    
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "我的最愛"
        self.view.backgroundColor = .black34Color
        register()
        setupTableView()
        setupRefreshController()
    }
    
    // MARK: - Setup UI
    
    private func register() {
        let nib = UINib(nibName: MyFavoriteTableViewCell.nibName, bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: MyFavoriteTableViewCell.nibName)
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func setupRefreshController() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
        refreshControl.tintColor = .white
        tableView.refreshControl = refreshControl
    }
    
    /// 下拉重新整理
    @objc
    private func handleRefreshControl() {
        
        // 為了讓使用者感覺有更新，所以慢一秒
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            
            guard let self = self else { return }
            
            self.tableView.reloadData()
            
            self.tableView.refreshControl?.endRefreshing()
        }
    }
    
}


// MARK: - UITableViewDelegate

extension MyFavoriteViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MyFavoriteTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let infos = viewModel.getFileData()
        let info = infos[indexPath.row]
        let vc = AnimalDetailViewController.instantiate()
        vc.setInfo(info: info)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: - UITableViewDataSource

extension MyFavoriteViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let infos = viewModel.getFileData()
        return infos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: MyFavoriteTableViewCell.nibName, for: indexPath) as! MyFavoriteTableViewCell
        let infos = viewModel.getFileData()
        let info = infos[indexPath.row]
        cell.set(info: info)
        return cell
    }
    
    
}
