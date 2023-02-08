//
//  DetailsViewController.swift
//  APINasaVIPERTestApp
//
//  Created by Юрий Альт on 27.01.2023.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    //MARK: - Views
    private lazy var detailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    //MARK: - Public Properties
    var presenter: DetailsViewOutputProtocol!
    
    //MARK: - Private Properties
    private let configurator = DetailsViewConfigurator()
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray3
        view.addAutolayoutSubviews(detailImageView)
        setupConstraints()
        presenter.didLoad()
    }
    
    //MARK: - Public Methods
    func configure(with image: UIImage) {
        detailImageView.image = image
    }
}

//MARK: - DetailsViewInputProtocol
extension DetailsViewController: DetailsViewInputProtocol {
    func reloadImage(with data: Data) {
        let image = UIImage(data: data)
        detailImageView.image = image
    }
    
}

//MARK: - Layout
extension DetailsViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            detailImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            detailImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            detailImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }
}
