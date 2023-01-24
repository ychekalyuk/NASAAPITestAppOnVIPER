//
//  MainViewInteractorOutputProtocol.swift
//  APINasaVIPERTestApp
//
//  Created by Юрий Альт on 20.01.2023.
//

import Foundation

protocol MainViewInteractorOutputProtocol: AnyObject {
    func recieveAPODData(with apods: [APOD])
}
