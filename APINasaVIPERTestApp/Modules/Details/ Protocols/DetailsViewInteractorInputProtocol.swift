//
//  DetailsViewInteractorInputProtocol.swift
//  APINasaVIPERTestApp
//
//  Created by Юрий Альт on 30.01.2023.
//

import Foundation

protocol DetailsViewInteractorInputProtocol {
    init(presenter: DetailsViewInteractorOutputProtocol, networkManager: NetworkManagerProtocol)
    
    func loadImageData(url: String)
}
