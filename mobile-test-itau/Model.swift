//
//  Model.swift
//  mobile-test-itau
//
//  Created by Pedro Vargas on 23/07/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import Foundation

class Model{
    
    static let shared = Model()
    
    
    var nomeCliente: String = ""
    var contaPoupanca: Double = 0
    var contaCorrente: Double = 0
    var contatos: [String] = []
    
    
    func resgatarDados(){
        Dados.acessarDados { json in
            
            guard let Dados = json else { return }
            do {
                if let DadosCliente = try JSONSerialization.jsonObject(with: Dados, options: []) as? [String: Any] {
                    if let nome = DadosCliente["nome_cliente"] as? String {
                        self.nomeCliente = nome
                    }
                    if let poupanca = DadosCliente["saldo_Poupanca"] as? Double {
                        self.contaPoupanca = poupanca
                    }
                    if let corrente = DadosCliente["saldo_Corrente"] as? Double {
                        self.contaCorrente = corrente
                    }
                    if let contatos_cliente = DadosCliente["contatos"] as? Array<Dictionary<String, String>>{
                        for contato in contatos_cliente{
                            self.contatos.append(contato["nome"] ?? "")
                        }
                    }
                }
            } catch let error {
                print(error.self)
                print(error.localizedDescription)
            }
            
            
        }
    }
    
    private init(){}
    
}
