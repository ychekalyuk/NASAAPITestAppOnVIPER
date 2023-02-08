//
//  DetailsViewPresenter.swift
//  APINasaVIPERTestApp
//
//  Created by Юрий Альт on 27.01.2023.
//

import Foundation

class DetailsViewPresenter: DetailsViewOutputProtocol {
    //MARK: - Public Properties
    weak var view: DetailsViewInputProtocol!
    var urlString: String?
    
    //MARK: - Private Properties
    var interactor: DetailsViewInteractorInputProtocol!
    
    //MARK: - Lifecycle Methods
    required init(view: DetailsViewInputProtocol) {
        self.view = view
    }
    
    //MARK: - Public Methods
    func didLoad() {
        loadImageData()
    }
    
    //MARK: - Private Metods
    private func loadImageData() {
        guard let urlString = urlString else { return }
        interactor.loadImageData(url: urlString)
    }
}

//MARK: - DetailsViewInteractorOutputProtocol
extension DetailsViewPresenter: DetailsViewInteractorOutputProtocol {
    
    func recieveImageData(with imageData: Data) {
        view.reloadImage(with: imageData)
    }
}
