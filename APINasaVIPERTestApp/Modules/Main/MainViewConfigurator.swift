//
//  MainViewConfigurator.swift
//  APINasaVIPERTestApp
//
//  Created by Юрий Альт on 20.01.2023.
//

final class MainViewConfigurator: MainViewConfiguratorInputProtocol {
    func configure(with view: MainViewController) {
            let presenter = MainViewPresenter(view: view)
            let interactor = MainViewInteractor(presenter: presenter)
            view.presenter = presenter
            presenter.interactor = interactor
        }
}
