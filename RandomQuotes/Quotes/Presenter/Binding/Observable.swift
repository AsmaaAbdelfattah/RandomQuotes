//
//  Observable.swift
//  RandomQuotes
//
//  Created by asma abdelfattah on 09/03/2026.
//

import Foundation
class Observable<T>{
    
    var value:T {
        didSet{
            listener?(value)
        }
    }
    
    private var listener: ((T)-> Void)?
    
    init(value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping ((T)-> Void)){
        listener = closure
        closure(value)
    }
}
