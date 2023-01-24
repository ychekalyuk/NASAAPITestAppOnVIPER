//
//  APOD.swift
//  APINasaVIPERTestApp
//
//  Created by Юрий Альт on 20.01.2023.
//

struct APOD: Decodable {
    let date: String
    let explanation: String
    let hdurl: String?
    let mediaType: String?
    let serviceVersion: String
    let title: String
    let url: String
    
    private enum CodingKeys: String, CodingKey {
        case date
        case explanation
        case hdurl
        case mediaType = "mediaType"
        case serviceVersion = "service_version"
        case title
        case url
    }
}
