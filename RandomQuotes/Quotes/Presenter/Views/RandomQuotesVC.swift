//
//  ViewController.swift
//  RandomQuotes
//
//  Created by asma abdelfattah on 04/03/2026.
//

import UIKit
import Combine


class RandomQuotesVC: UIViewController {

    @IBOutlet weak var quoteLbl: UILabel!
    @IBOutlet weak var quoteBtn: UIButton!{
        didSet{
            quoteBtn.layer.cornerRadius = 12
        }
    }
   
    //MARK: vars
    let viewModel = getQuotesViewModel()
    var cancellable = Set<AnyCancellable>()
    
    //MARK: life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getRandomQuote()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        bindQuote()
    }

    func bindQuote(){
        viewModel.$quote.receive(on: DispatchQueue.main).sink {[weak self] quote in
            self?.quoteLbl.text = quote
        }.store(in: &cancellable)
    }

    @IBAction func quoteBtnTapped(_ sender: Any) {
        viewModel.getRandomQuote()
    }
    
    
    
}

func getQuotesViewModel()->RandomQuotesViewModel{
   
    let quotesDataSource = RandomQuotesDataSource()
    
    let quotesImplemnter = RandomQuotesImplementer(dataSource: quotesDataSource)
    
    let quotesUseCase = RandomQuotesUseCase(quotesImplemnter: quotesImplemnter)
    
    return RandomQuotesViewModel(quotesUseCase: quotesUseCase)
}
