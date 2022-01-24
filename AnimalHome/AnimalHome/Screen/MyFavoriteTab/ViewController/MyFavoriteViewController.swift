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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // TOOD: - 處理viewmodle的生命週期
        viewModel.getFileData()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func register() {
        let nib = UINib(nibName: MyFavoriteTableViewCell.nibName, bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: MyFavoriteTableViewCell.nibName)
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
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
