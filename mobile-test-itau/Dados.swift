//
//  Dados.swift
//  mobile-test-itau
//
//  Created by Pedro Vargas on 23/07/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import Foundation

//Exemplo de comunicaçao com API

var dadosClienteJson = """
{
    "nome_cliente": "ClienteItau",
    "saldo_Corrente": 30000.00,
    "saldo_Poupanca": 15340.00,
    "contatos": [
        {
            "nome": "André"
        },
        {
            "nome": "Joao"
        },
        {
            "nome": "Ana"
        },
        {
            "nome": "Carlos"
        },
        {
            "nome": "Carol"
        },
        {
            "nome": "Thiago"
        },
        {
            "nome": "Julia"
        },
        {
            "nome": "Lucas"
        },
        {
            "nome": "José"
        }
    ]
}
"""

class Dados {
    static func acessarDados(completion:((_ json: Data?) -> Void)){
        
        completion(Data(dadosClienteJson.utf8))
    }
}
