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
        return view
    }()
    
    private var infos: [Animal] = []
    
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
        setupTableView()
        setupUI()
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
        self.tableView.register(AnimalTableViewCell.classForCoder(), forCellReuseIdentifier: "AnimalTableViewCell")
    }
    

    
    
}

// MARK: - UITableViewDelegate

extension AnimalViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource

extension AnimalViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.catInfos.isEmpty ? 0 : viewModel.catInfos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalTableViewCell", for: indexPath) as! AnimalTableViewCell
        let info = viewModel.catInfos[indexPath.row]
        cell.set(info: info)
        return cell
    }
    
    
}


// MARK: - AnimalViewModelDelegate

extension AnimalViewController: AnimalViewModelDelegate {
    
    func updateInfo() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            print("\(self.viewModel.catInfos.first)")
//            print("\(self.viewModel.dagInfos.first)")
        }
    }
    
}
