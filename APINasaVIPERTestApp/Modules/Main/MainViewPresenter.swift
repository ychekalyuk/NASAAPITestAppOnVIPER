//
//  MainViewPresenter.swift
//  APINasaVIPERTestApp
//
//  Created by Юрий Альт on 20.01.2023.
//

import Foundation

final class MainViewPresenter: MainViewOutputProtocol {
    //MARK: - Public Properties
    weak var view: MainViewInputProtocol!
    
    //MARK: - Private Properties
    var interactor: MainViewInteractorInputProtocol!
    
    //MARK: - Lifecycle Methods
    init(view: MainViewInputProtocol) {
        self.view = view
    }
    
    //MARK: - Public Methods
    func didLoad() {
        interactor.loadAPODData()
    }
}

//MARK: - MainViewInteractorOutputProtocol
extension MainViewPresenter: MainViewInteractorOutputProtocol {
    func recieveAPODData(with apods: [APOD]) {
        view.reloadData(with: apods)
    }
}
