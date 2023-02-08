//
//  MainViewConfigurator.swift
//  APINasaVIPERTestApp
//
//  Created by Юрий Альт on 20.01.2023.
//

final class MainViewConfigurator: MainViewConfiguratorInputProtocol {
    func configure(with view: MainViewController) {
        let presenter = MainViewPresenter(view: view)
        let networkManager = NetworkManager()
        let interactor = MainViewInteractor(presenter: presenter, networkManager: networkManager)
        let router = MainViewRouter(view: view)
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
