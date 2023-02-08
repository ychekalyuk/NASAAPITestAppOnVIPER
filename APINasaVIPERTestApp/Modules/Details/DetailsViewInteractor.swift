//
//  DetailsViewInteractor.swift
//  APINasaVIPERTestApp
//
//  Created by Юрий Альт on 30.01.2023.
//

import Foundation

class DetailsViewInteractor: DetailsViewInteractorInputProtocol {
    //MARK: - Public Properties
    weak var presenter: DetailsViewInteractorOutputProtocol!
    
    //MARK: - Private Properties
    private let networkManager: NetworkManagerProtocol!
    
    //MARK: - Lifecycle Methods
    required init(presenter: DetailsViewInteractorOutputProtocol, networkManager: NetworkManagerProtocol) {
        self.presenter = presenter
        self.networkManager = networkManager
    }
    
    func loadImageData(url: String) {
        guard let url = URL(string: url) else { return }
        ImageManager.shared.fetchImageData(from: url) { [weak self] imageData in
            guard let self else { return }
            self.presenter.recieveImageData(with: imageData)
        }
    }
}
