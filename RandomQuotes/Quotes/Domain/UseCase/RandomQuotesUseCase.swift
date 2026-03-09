//
//  RandomQuotesUseCase.swift
//  RandomQuotes
//
//  Created by asma abdelfattah on 09/03/2026.
//

import Foundation
protocol RandomQuotesUseCaseProtocol{
    func getRandomQuote(compeltion: @escaping (Result<RandomQuotes, any Error>) -> Void)
}
class RandomQuotesUseCase:RandomQuotesUseCaseProtocol{
    
    let quotesImplemnter: RandomQuotesImpProtocol
    
    init(quotesImplemnter: RandomQuotesImpProtocol) {
        self.quotesImplemnter = quotesImplemnter
    }
    
    func getRandomQuote(compeltion: @escaping (Result<RandomQuotes, any Error>) -> Void) {
        quotesImplemnter.getRandomQuote(compeltion: compeltion)
    }
}
