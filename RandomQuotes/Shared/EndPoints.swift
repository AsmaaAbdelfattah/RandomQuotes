//
//  EndPoints.swift
//  RandomQuotes
//
//  Created by asma abdelfattah on 04/03/2026.
//

import Foundation
enum EndPoints{
    
    private var baseUrl: String { return "https://dummyjson.com/quotes/"}
    
    case random
    case tages
}

extension EndPoints{
    
    var fullPath :String {
        
        var endPoint: String
        
        switch self {
        case .random:
            endPoint = "random"
        case .tages:
            endPoint = ""
        }
        
    return baseUrl + endPoint
    }
    
}
