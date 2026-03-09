//
//  RandomQuotesImpProtocol.swift
//  RandomQuotes
//
//  Created by asma abdelfattah on 09/03/2026.
//

import Foundation
protocol RandomQuotesImpProtocol{
    func getRandomQuote(compeltion: @escaping (Result<RandomQuotes,Error>) ->Void)
}
