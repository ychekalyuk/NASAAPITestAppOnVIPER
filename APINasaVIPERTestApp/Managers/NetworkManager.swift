//
//  NetworkManager.swift
//  APINasaVIPERTestApp
//
//  Created by Юрий Альт on 20.01.2023.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchData(completion: @escaping (_ apods: [APOD]) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    private let apiURL = "https://api.nasa.gov/planetary/apod?api_key=sQBcw3N26Wee3jIhVwV2DBdAfAbejoy9s02IDsMz&count=10"
    
    func fetchData(completion: @escaping (_ apods: [APOD]) -> Void) {
        guard let url = URL(string: apiURL) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No Discription")
                return
            }
            do {
                let decoder = JSONDecoder()
                let apods = try decoder.decode([APOD].self, from: data)
                DispatchQueue.main.async {
                    completion(apods)
                }
            } catch let error {
                print("Error serialization json", error)
            }
        }.resume()
    }
}

