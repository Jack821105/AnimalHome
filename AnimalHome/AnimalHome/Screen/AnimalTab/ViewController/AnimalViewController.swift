//
//  AnimalViewController.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/2.
//

import UIKit
import SnapKit

/// 動物主頁
class AnimalViewController: UIViewController {

    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var infos: [String] = ["1", "2", "3", "4"]
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        setupTableView()
        setupUI()
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
        return infos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalTableViewCell", for: indexPath) as! AnimalTableViewCell
        let info = infos[indexPath.row]
        print("JACK DEV \(info)")
        cell.set(info: info)
        return cell
    }
    
    
}
