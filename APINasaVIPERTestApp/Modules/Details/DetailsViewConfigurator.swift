//
//  DetailsViewConfigurator.swift
//  APINasaVIPERTestApp
//
//  Created by Юрий Альт on 30.01.2023.
//

import Foundation

final class DetailsViewConfigurator: DetailsViewConfiguratorInputProtocol {
    func configure(with view: DetailsViewController) {
        let presenter = DetailsViewPresenter(view: view)
        let networkManager = NetworkManager()
        let interactor = DetailsViewInteractor(presenter: presenter, networkManager: networkManager)
        view.presenter = presenter
        presenter.interactor = interactor
    }
}
