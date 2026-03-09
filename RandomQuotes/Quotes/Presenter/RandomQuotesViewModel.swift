//
//  RandomQuotesViewModel.swift
//  RandomQuotes
//
//  Created by asma abdelfattah on 09/03/2026.
//

import Foundation

protocol RandomQuotesViewModelProtocol{
    
    
    func getRandomQuote()
}
class RandomQuotesViewModel:RandomQuotesViewModelProtocol {
   
    @Published var quote:String = ""
    let quotesUseCase:RandomQuotesUseCaseProtocol
    
    init( quotesUseCase: RandomQuotesUseCaseProtocol) {
        self.quotesUseCase = quotesUseCase
    }
    
    
    func getRandomQuote() {
        quotesUseCase.getRandomQuote { [weak self] result in
            switch result {
            case .success(let success):
                self?.quote = success.quote
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    
}
