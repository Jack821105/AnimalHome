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
        return MyFavoriteViewModel()
    }()
    
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "我的最愛"
        register()
        setupTableView()
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
    
}

extension MyFavoriteViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let infos = viewModel.getFileData()
        return infos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: MyFavoriteTableViewCell.nibName, for: indexPath) as! MyFavoriteTableViewCell
        let infos = viewModel.getFileData()
        let info = infos[indexPath.row]
        
//        cell.set(info: info)
        
        return cell
    }
    
    
}
