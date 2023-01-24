//
//  MainViewInteractor.swift
//  APINasaVIPERTestApp
//
//  Created by Юрий Альт on 20.01.2023.
//

final class MainViewInteractor: MainViewInteractorInputProtocol {
    //MARK: - Public Properties
    weak var presenter: MainViewInteractorOutputProtocol!
    
    //MARK: - Private Properties
    private let networkManager: NetworkManagerProtocol!
    
    //MARK: - Lifecycle Methods
    init(presenter: MainViewInteractorOutputProtocol, networkManager: NetworkManagerProtocol) {
        self.presenter = presenter
        self.networkManager = networkManager
    }
    
    //MARK: - Public Methods
    func loadAPODData() {
        networkManager.fetchData { [weak self] apods in
            self?.presenter.recieveAPODData(with: apods)
        }
    }
}
