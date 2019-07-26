//
//  ViewController.swift
//  mobile-test-itau
//
//  Created by Pedro Vargas on 23/07/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//tela inicial para resgatar os dados da API
    override func viewDidLoad() {
        super.viewDidLoad()
        Model.shared.resgatarDados()
        
    }

    @IBAction func irParaTransferencia(_ sender: Any) {
        performSegue(withIdentifier: "irParaTransferencia", sender: self)
    }
    
}

extension String {
    // extensao para usar substring usada para retornar somente o dia do NSDate()
    subscript(_ range: CountableRange<Int>) -> String {
        let idx1 = index(startIndex, offsetBy: max(0, range.lowerBound))
        let idx2 = index(startIndex, offsetBy: min(self.count, range.upperBound))
        return String(self[idx1..<idx2])
    }
}
