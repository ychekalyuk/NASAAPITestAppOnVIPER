//
//  ViewController.swift
//  APINasaVIPERTestApp
//
//  Created by Юрий Альт on 20.01.2023.
//

import UIKit
import Kingfisher

final class MainViewController: UIViewController {
    //MARK: - Views
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(cell: MainTableViewCell.self)
        tableView.layer.cornerRadius = 10
        tableView.dataSource = self
        return tableView
    }()
    
    //MARK: - Public Properties
    var presenter: MainViewOutputProtocol!
    
    //MARK: - Private Properties
    private let configurator = MainViewConfigurator()
    private var apods: [APOD] = []
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        view.backgroundColor = .lightGray
        view.addAutolayoutSubviews(mainTableView)
        setupConstraints()
        presenter.didLoad()
    }
}

//MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        apods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let apod = apods[indexPath.row]
        let mainTableViewCell: MainTableViewCell = tableView.dequeueCell(for: indexPath)
        mainTableViewCell.configure(title: apod.title, url: apod.url)
        return mainTableViewCell
    }
}

//MARK: - MainViewInputProtocol
extension MainViewController: MainViewInputProtocol {
    func reloadData(with apods: [APOD]) {
        self.apods = apods
        mainTableView.reloadData()
    }
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


