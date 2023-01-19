//
//  ViewController.swift
//  APINasaVIPERTestApp
//
//  Created by Юрий Альт on 20.01.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    //MARK: - Views
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.cornerRadius = 10
        tableView.dataSource = self
        return tableView
    }()
    
    //MARK: - Public Properties
    var presenter: MainViewOutputProtocol!
    
    //MARK: - Private Properties
    private let configurator: MainViewConfiguratorInputProtocol = MainViewConfigurator()
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        view.backgroundColor = .lightGray
        view.addAutolayoutSubviews(mainTableView)
        setupConstraints()
    }
}

//MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = "Hello \(indexPath.row)"
        cell.contentConfiguration = content
        return cell
    }
}

//MARK: - MainViewInputProtocol
extension MainViewController: MainViewInputProtocol {
    
}

//MARK: - Layout
private extension MainViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            mainTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            mainTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
    }
}


