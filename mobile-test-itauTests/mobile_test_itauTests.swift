//
//  mobile_test_itauTests.swift
//  mobile-test-itauTests
//
//  Created by Pedro Vargas on 23/07/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import XCTest
@testable import mobile_test_itau


class mobile_test_itauTests: XCTestCase {

    var viewController: PagamentoViewController!
    let diaAtual: String = NSDate().description[8..<10]
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PagamentoViewController") as! PagamentoViewController
       viewController = vc
        _ = viewController.view
    }
    
    func testeValidacaoDia(){
        // testar dias iguais e dias diferentes de transferencias, o valor limite de transferencia
        
        
        Model.shared.diaTransferencia = String(Int(diaAtual)! - 1) //inserir dia anterior
        Model.shared.valorTransferido = 10000
        viewController.verificaDia()
        //valor transferido é resetado pois o dia ja trocou
        XCTAssertEqual(Model.shared.valorTransferido, 0)
        
        
    }
    func testeValidacaoDia2(){
        
        Model.shared.diaTransferencia =  diaAtual// inserir dia atual
        Model.shared.valorTransferido = 10000
        viewController.verificaDia()
        // valor transferido continua 10000 pois o dia não mudou ainda
        XCTAssertNotEqual(Model.shared.valorTransferido, 0)
    }
    
    func testevalidaValorTransferencia(){
        Model.shared.tipoConta = 0
        Model.shared.contaCorrente = 20000
        Model.shared.diaTransferencia = "28"
        viewController.valorTransferencia.text = "5000"
        viewController.atualizaInformacoes()
        viewController.botaoConfirmar(viewController.botaoConfirma as Any)
        viewController.valorTransferencia.text = "7000"
        viewController.atualizaInformacoes()
        viewController.botaoConfirmar(viewController.botaoConfirma as Any)
    //valor da conta corrente verificado após duas tentativas de transferencia, como a trasnferencia de 7000 reais
    // iria exceder o limite de 10000 reais, só foi aceita a transferencia de 5000 resultando no valor de 15000 reais na conta corrente
        XCTAssertEqual(Model.shared.contaCorrente, 15000)
    }
    
    
    
    
}
