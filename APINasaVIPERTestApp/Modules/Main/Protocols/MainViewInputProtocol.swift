//
//  MainViewInputProtocol.swift
//  APINasaVIPERTestApp
//
//  Created by Юрий Альт on 20.01.2023.
//

protocol MainViewInputProtocol: AnyObject {
    func reloadData(with models: [APOD])
}
