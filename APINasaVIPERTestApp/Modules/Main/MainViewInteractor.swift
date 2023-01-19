//
//  MainViewInteractor.swift
//  APINasaVIPERTestApp
//
//  Created by Юрий Альт on 20.01.2023.
//

final class MainViewInteractor: MainViewInteractorInputProtocol {
    
    weak var presenter: MainViewInteractorOutputProtocol!
    
    init(presenter: MainViewInteractorOutputProtocol) {
        self.presenter = presenter
    }
}
