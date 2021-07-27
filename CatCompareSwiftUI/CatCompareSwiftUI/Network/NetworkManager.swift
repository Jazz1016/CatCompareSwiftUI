//
//  NetworkManager.swift
//  CatCompareSwiftUI
//
//  Created by James Lea on 7/27/21.
//

import SwiftUI

class NetworkManager {
    
    static private let baseURL = URL(string: "https://api.thecatapi.com/v1")
    static private let breedsEndpoint = "breeds"
    
    // MARK: - Functions
    static func fetchCats(completion: @escaping (Result<[Cat], CatError>) -> Void) {
        guard let baseURL = baseURL else { return completion(.failure(.invalidURL)) }
        let finalURL = baseURL.appendingPathComponent(breedsEndpoint)
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            if let response = response as? HTTPURLResponse {
                print("CAT STATUS CODE: \(response.statusCode)")
            }
            
            guard let data = data else {return completion(.failure(.noData))}
            
            do {
                let topLevelObject = try JSONDecoder().decode([Cat].self, from: data)
                DispatchQueue.main.async { completion(.success(topLevelObject)) }
            } catch {
                completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
    
//    static func fetchCatBreed(name: String, completion: @escaping (Result<[Cat], CatError>) -> Void) {
//
//        for i in name {
//
//            if i == " "{
//                //                i = "%20"
//            }
//        }
//
//        let baseURL = "https://api.thecatapi.com/v1/breeds"
//
//        var components = URLComponents(string: baseURL)
//        let searchQuery = URLQueryItem(name: "search", value: name)
//
//        components?.queryItems = [searchQuery]
//
//        guard let finalURL = components?.url else {return completion(.failure(.invalidURL))}
//        //        print(components?.string)
//        print(baseURL)
//        let url = finalURL
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                return completion(.failure(.thrownError(error)))
//            }
//
//            if let response = response as? HTTPURLResponse {
//                print("CAT STATUS CODE: \(response.statusCode)")
//            }
//
//            guard let data = data else {return completion(.failure(.noData))}
//
//            do {
//                let catBreed = try JSONDecoder().decode([Cat].self, from: data)
//                //                print(catBreed)
//                completion(.success(catBreed))
//            } catch {
//                completion(.failure(.thrownError(error)))
//            }
//        }.resume()
//    }
    
//    static func fetchCatImageURL(cat: Cat, completion: @escaping (Result<CatImage, CatError>) -> Void){
//        let id = cat.reference_image_id
//
//
//
//        guard let imageURL = URL(string: "https://api.thecatapi.com/v1/images/\(id)") else {return completion(.failure(.invalidURL))}
//
//        //        var components = URLComponents(url: countryURL, resolvingAgainstBaseURL: true)
//        //        let apiQuery = URLQueryItem(name: "key", value: apiKey)
//        //        components?.queryItems = [apiQuery]
//
//
//        URLSession.shared.dataTask(with: imageURL) { data, response, error in
//            if let error = error {
//                return completion(.failure(.thrownError(error)))
//            }
//            guard let data = data else {return completion(.failure(.noData))}
//
//            do {
//
//                let imageTop = try JSONDecoder().decode(CatImage.self, from: data)
//                completion(.success(imageTop))
//
//            } catch {
//
//                completion(.failure(.thrownError(error)))
//
//            }
//        }.resume()
//    }
//
//    static func fetchCatImage(url: URL?, completion: @escaping (Result<UIImage, CatError>) -> Void){
//
//        guard let urlToUse = url else {return completion(.failure(.invalidURL))}
//
//        print(urlToUse)
//
//        URLSession.shared.dataTask(with: urlToUse) { data, response, error in
//
//            if let error = error {
//                return completion(.failure(.thrownError(error)))
//            }
//
//            if let response = response as? HTTPURLResponse {
//                print("CATIMAGE STATUS CODE \(response.statusCode)")
//            }
//
//            guard let data = data else {return completion(.failure(.noData))}
//
//            guard let image = UIImage(data: data) else { return completion(.failure(.unableToDecode)) }
//
//            completion(.success(image))
//
//        }.resume()
//    }
}//End of class
