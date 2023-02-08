//
//  MainViewRouter.swift
//  APINasaVIPERTestApp
//
//  Created by Юрий Альт on 30.01.2023.
//

import Foundation
import UIKit

class MainViewRouter: MainViewRouterProtocol {

    //MARK: - Public Properties
    weak var view: MainViewController!
    
    init(view: MainViewController) {
        self.view = view
    }
    
    func showDetailsScreen(url: String) {
        let detailsViewController = DetailsViewController()
        let presenter = DetailsViewPresenter(view: detailsViewController)
        let networkManager = NetworkManager()
        let interactor = DetailsViewInteractor(presenter: presenter, networkManager: networkManager)
        detailsViewController.presenter = presenter
        presenter.interactor = interactor
        presenter.urlString = url
        view.present(detailsViewController, animated: true, completion: nil)
    }
    
    
}
