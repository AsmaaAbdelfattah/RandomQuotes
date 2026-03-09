//
//  RandomQuotesDataSource.swift
//  RandomQuotes
//
//  Created by asma abdelfattah on 09/03/2026.
//

import Foundation
protocol RandomQuotesDataSourceProtocol {
    func getRandomQuote(compeltion: @escaping (Result<RandomQuotes,Error>) ->Void)
}
class RandomQuotesDataSource:RandomQuotesDataSourceProtocol{
  
    func getRandomQuote(compeltion: @escaping (Result<RandomQuotes,Error>) ->Void) {
        NetworkManager.shared.getData(url: EndPoints.random.fullPath) { (result:Result<RandomQuotes,Error>)  in
            switch result {
            case .success(let success):
                compeltion(.success(success))
            case .failure(let failure):
                compeltion(.failure(failure))
            }
        }
    }
}
