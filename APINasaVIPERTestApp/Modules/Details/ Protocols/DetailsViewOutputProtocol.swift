//
//  DetailsViewOutputProtocol.swift
//  APINasaVIPERTestApp
//
//  Created by Юрий Альт on 30.01.2023.
//

import Foundation

protocol DetailsViewOutputProtocol {
    init(view: DetailsViewInputProtocol)
    func didLoad()
}
