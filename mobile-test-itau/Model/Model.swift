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
    
    private init(){
        diaTransferencia = UserDefaults.standard.string(forKey: "diaTransferencia")
        valorTransferido = UserDefaults.standard.double(forKey: "valorTransferido")
    }

    var nomeCliente: String = "" // criado pois em um app maior seria necessario
    var contaPoupanca: Double = 0
    var contaCorrente: Double = 0
    var contatos: [String] = []
    var tipoConta: Int!
    var contatoSelecionado = ""
    var valorTransferido: Double{
        didSet{
            UserDefaults.standard.set(self.valorTransferido, forKey: "valorTransferido")
        }
    }
    var diaTransferencia: String!{
        didSet{
            UserDefaults.standard.set(self.diaTransferencia, forKey: "diaTransferencia")
        }
    }
    
    func resgatarDados(){
        Dados.acessarDados { json in
            //exemplo acessando dados de uma API
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
    
   
    
}
