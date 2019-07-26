//
//  TransferenciaTableViewController.swift
//  mobile-test-itau
//
//  Created by Pedro Vargas on 23/07/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit

class TransferenciaTableViewController: UITableViewController {
    let section = ["de: ", "para: "]
    var selecionado = false //controle se a opção conta foi selecionada
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        Model.shared.contatoSelecionado = ""
        Model.shared.tipoConta = 3
        Model.shared.contatos = Model.shared.contatos.sorted(by: <) // ordena os contatos
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       return self.section[section]
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.section.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0{
            return 2
        }
        return Model.shared.contatos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transferenciaCell", for: indexPath)
        
        if indexPath.section == 0{
            if indexPath.row == 0{
                cell.textLabel!.text = "conta corrente (R$ \(Model.shared.contaCorrente))"
                
            }else{
                cell.textLabel!.text = "conta poupanca (R$ \(Model.shared.contaPoupanca))"
            }
            return cell
        }
        cell.textLabel?.text = Model.shared.contatos[indexPath.row]
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let cell1 = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        let cell2 = tableView.cellForRow(at: IndexPath(row: 1, section: 0))
//        verifica qual tipo de conta foi selecionado, salva no model e insere checkmark
        if indexPath.row == 0 && indexPath.section == 0{
            cell1?.accessoryType = .checkmark
            cell2?.accessoryType = .none
            selecionado = true
            Model.shared.tipoConta = 0
            
        }else if indexPath.row == 1 && indexPath.section == 0{
            cell1?.accessoryType = .none
            cell2?.accessoryType = .checkmark
            selecionado = true
            Model.shared.tipoConta = 1
            
        }else if selecionado == true{
            selecionado = false
            Model.shared.contatoSelecionado = Model.shared.contatos[indexPath.row]
            performSegue(withIdentifier: "vaiParaPagamento", sender: self)
        }
        
       
}



}
