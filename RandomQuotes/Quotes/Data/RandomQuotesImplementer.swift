//
//  RandomQuotesImplementer.swift
//  RandomQuotes
//
//  Created by asma abdelfattah on 09/03/2026.
//

import Foundation
class RandomQuotesImplementer: RandomQuotesImpProtocol{
    
    let dataSource:RandomQuotesDataSourceProtocol
    
    init(dataSource: RandomQuotesDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func getRandomQuote(compeltion: @escaping (Result<RandomQuotes, any Error>) -> Void) {
        dataSource.getRandomQuote(compeltion: compeltion)
    }
}
