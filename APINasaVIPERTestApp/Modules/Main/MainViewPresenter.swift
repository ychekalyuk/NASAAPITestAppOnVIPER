//
//  MainViewPresenter.swift
//  APINasaVIPERTestApp
//
//  Created by Юрий Альт on 20.01.2023.
//

final class MainViewPresenter: MainViewOutputProtocol {
    
    weak var view: MainViewInputProtocol!
    var interactor: MainViewInteractorInputProtocol!
    
    init(view: MainViewInputProtocol) {
        self.view = view
    }
}

extension MainViewPresenter: MainViewInteractorOutputProtocol {
    
}
