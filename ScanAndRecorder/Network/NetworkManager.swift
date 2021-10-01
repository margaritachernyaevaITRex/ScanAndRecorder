//
//  NetworkManager.swift
//  ScanAndRecorder
//
//  Created by Margarita Chernyaeva on 30.09.21.
//

import Foundation

class NetworkManager {
    
    // TODO: - change url to show all heroes with pagination
    // TODO: - show only heroes that have images
    // TODO: - make url more private with keys(?) and beatiful ))))
    static func getHeroes(completion: @escaping (Result<[Hero], Error>) ->()) {
        let url = URL(string: "http://gateway.marvel.com/v1/public/characters?apikey=d0c15f26d42e10650e2f9d927699b289&ts=1&hash=4e513ee9a0d0da823eea679e2b41f708&limit=40")
        guard let url = url else {
            NSLog("URL == nil")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                NSLog(error.localizedDescription)
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let object = try JSONDecoder().decode(Object.self, from: data)
                let heroes = object.data.results
                completion(.success(heroes))
            } catch {
                print(error)
                completion(.failure(error))
            }
        }.resume()
    }
}

