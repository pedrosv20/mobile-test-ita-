//
//  ViewController.swift
//  mobile-test-itau
//
//  Created by Pedro Vargas on 23/07/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Model.shared.resgatarDados()
    }
    
    @IBAction func irParaTransferencia(_ sender: Any) {
        performSegue(withIdentifier: "irParaTransferencia", sender: self)
    }
    
}

