//
//  MainTableViewCell.swift
//  APINasaVIPERTestApp
//
//  Created by Юрий Альт on 20.01.2023.
//

import UIKit
import AVFoundation

class MainTableViewCell: ReusableTableViewCell {
    //MARK: - Views
    private lazy var mainContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray2
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var apodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    //MARK: - Life Cycle Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .secondaryLabel
        contentView.addAutolayoutSubview(mainContentView)
        mainContentView.addAutolayoutSubviews(titleLabel, apodImageView, activityIndicatorView)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Public Methods
    func configure(title: String, url: String) {
        titleLabel.text = title
        guard let imageURL = URL(string: url) else { return }
        if let cachedImage = getCachedImage(from: imageURL) {
            apodImageView.image = cachedImage
            self.activityIndicatorView.stopAnimating()
        } else {
            ImageManager.shared.fetchImageData(from: imageURL) { [weak self] imageData in
                guard let self else { return }
                self.apodImageView.image = UIImage(data: imageData)
                self.activityIndicatorView.stopAnimating()
            }
        }
    }
    
    //MARK: - Private Methods
    private func saveDataToCache(with data: Data, and response: URLResponse) {
        guard let url = response.url else { return }
        let request = URLRequest(url: url)
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: request)
    }
    
    private func getCachedImage(from url: URL) -> UIImage? {
        let request = URLRequest(url: url)
        if let cashedResponse = URLCache.shared.cachedResponse(for: request) {
            return UIImage(data: cashedResponse.data)
        }
        return nil
    }
    
    //MARK: - Layout
    private func setupLayout() {
        NSLayoutConstraint.activate([
            mainContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainContentView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            mainContentView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            mainContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: mainContentView.topAnchor, constant: 40),
            titleLabel.leftAnchor.constraint(equalTo: mainContentView.leftAnchor, constant: 40),
            titleLabel.rightAnchor.constraint(equalTo: mainContentView.rightAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            apodImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            apodImageView.leftAnchor.constraint(equalTo: mainContentView.leftAnchor, constant: 40),
            apodImageView.rightAnchor.constraint(equalTo: mainContentView.rightAnchor, constant: -40),
            apodImageView.bottomAnchor.constraint(equalTo: mainContentView.bottomAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: apodImageView.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: apodImageView.centerYAnchor)
        ])
    }
}
