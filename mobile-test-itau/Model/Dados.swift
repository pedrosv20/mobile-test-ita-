//
//  Dados.swift
//  mobile-test-itau
//
//  Created by Pedro Vargas on 23/07/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import Foundation

//Exemplo de dados recebidos na comunicaçao por API

var dadosClienteJson = """
{
    "nome_cliente": "ClienteItau",
    "saldo_Corrente": 30000.00,
    "saldo_Poupanca": 15340.00,
    "contatos": [
        {
            "nome": "André Carvalho"
        },
        {
            "nome": "João Oliveira"
        },
        {
            "nome": "Ana Araújo"
        },
        {
            "nome": "Carlos Marques"
        },
        {
            "nome": "Carol dos Santos"
        },
        {
            "nome": "Thiago Pinheiro"
        },
        {
            "nome": "Julia Figueiredo"
        },
        {
            "nome": "Lucas Bastos"
        },
        {
            "nome": "José Costa"
        }
    ]
}
"""

class Dados {
    static func acessarDados(completion:((_ json: Data?) -> Void)){
        
        completion(Data(dadosClienteJson.utf8))
    }
}
