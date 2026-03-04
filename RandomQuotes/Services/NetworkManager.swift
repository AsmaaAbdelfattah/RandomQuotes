//
//  Untitled.swift
//  RandomQuotes
//
//  Created by asma abdelfattah on 04/03/2026.
//
import Foundation

protocol NetworkManagerProtocol{
    func getData<T>(url:String,complition: @escaping ((Result<T,Error>) -> Void)) where T : Decodable
}

class NetworkManager: NetworkManagerProtocol{
    
    static var shared:NetworkManager = NetworkManager()
    
    private init(){}
    
    func getData<T>(url:String,complition: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        guard let URL = URL(string: url) else {
            complition(.failure(NSError(domain: "Invalid URL", code: 400)))
            return
        }
        
        URLSession.shared.dataTask(with: URL){ response, _, failure in
            
            if let error = failure{
                complition(.failure(error))
            }
            
            if let data = response{
                do{
                    let result = try JSONDecoder().decode(T.self, from: data)
                    complition(.success(result))
                }catch{
                    complition(.failure(error))
                }
            }
            
            
        }.resume()
    }
}
