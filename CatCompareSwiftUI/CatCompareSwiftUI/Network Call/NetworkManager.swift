//
//  NetworkManager.swift
//  CatCompareSwiftUI
//
//  Created by James Lea on 7/27/21.
//

import UIKit

class NetworkManager {
    
    static func fetchCatBreeds(completion: @escaping (Result<[CatBreed], CatError>) -> Void) {
        let baseUrL = URL(string: "https://api.thecatapi.com/v1/breeds")
        guard let url = baseUrL else {return completion(.failure(.invalidURL))}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                print("CAT STATUS CODE: \(response.statusCode)")
            }
            guard let data = data else {return completion(.failure(.noData))}
            do {
                let topLevelObject = try JSONDecoder().decode([CatBreed].self, from: data)
                let catBreedArray = topLevelObject
                completion(.success(catBreedArray))
            } catch {
                completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
    
    static func fetchCatImageURL(catImageURL: String, completion: @escaping (UIImage?) -> Void){
        guard let url = URL(string: catImageURL) else {
            return completion(nil)
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                return completion(nil)
            }
            guard let data = data else { return completion(nil) }
            if let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }.resume()
    }
}//End of class
