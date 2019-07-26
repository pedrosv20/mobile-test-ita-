//
//  PagamentoViewController.swift
//  mobile-test-itau
//
//  Created by Pedro Vargas on 23/07/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit

class PagamentoViewController: UIViewController {

    @IBOutlet weak var contato: UILabel!
    @IBOutlet weak var tipoConta: UILabel!
    @IBOutlet weak var valorTransferencia: UITextField!
    
    @IBOutlet weak var botaoConfirma: UIButton! // usado para referencia nos testes
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        //atualiza os valores do tipo de conta selecionado, o valor disponivel para transferencia, o contato selecionado e o valor da transferencia
        atualizaInformacoes()
    }

    
    
    @IBAction func botaoConfirmar(_ sender: Any) {
        
        if valorTransferencia.text == "" {
            return
        }
        // verifica o dia da ultima transferencia feita, se os dias forem diferentes, o limite de 10 mil reais é zerado
        verificaDia()
        let limiteTeste = Double(valorTransferencia.text!)!
        // verifica se a pessoa ja transferiu 10 mil ou o valor inserido para transferir é maior
        if Model.shared.valorTransferido >= 10000 || Double(valorTransferencia.text!)! > 10000 {
            let alert = UIAlertController(title: "Valor máximo atingido", message: "Só é possivel transferir até R$ 10.000 por dia, tente novamente amanhã", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            
            return
        }
        // verifica se com o valor inserido, o limite vai ser maior que 10 mil
        if  limiteTeste + Model.shared.valorTransferido > 10000{
            let alert = UIAlertController(title: "Operação negada", message: "O valor de sua transferência irá exceder o valor limite diário, tente um valor menor ou espere até amanhã", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            
            return
        }
    // calcula o valor para ser retirado da conta e apresenta mensagens de confirmação ou rejeição
        confirmaPagamento()
    }

    func confirmaPagamento(){
        
        let transf = Double(valorTransferencia.text!)!

        if Model.shared.tipoConta == 0{
            //verifica se conta tem valor disponivel
            if Model.shared.contaCorrente >= transf {
                
                Model.shared.valorTransferido += transf
                Model.shared.contaCorrente -= transf
                let alert = UIAlertController(title: "Sucesso", message: "Transferência feita com sucesso", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
                atualizaInformacoes()
            }
            else{
                let alert = UIAlertController(title: "Saldo Insuficiente", message: "Por favor insira um valor de acordo com sua conta bancaria", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }
            
        else{
            if Model.shared.contaPoupanca >= transf{
                Model.shared.valorTransferido += transf
                Model.shared.contaPoupanca -= transf
                let alert = UIAlertController(title: "Sucesso", message: "Transferência feita com sucesso", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
                atualizaInformacoes()
                
            }
            else{
                let alert = UIAlertController(title: "Saldo Insuficiente", message: "Por favor insira um valor de acordo com sua conta bancaria", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
                
            }
        }
    }

    
    
    func atualizaInformacoes(){
        if Model.shared.tipoConta == 0{
            self.tipoConta.text = "    Conta corrente \(Model.shared.contaCorrente)"
        }else{
            self.tipoConta.text = "    Conta poupança \(Model.shared.contaPoupanca)"
        }
        
        self.contato.text = Model.shared.contatoSelecionado
    }
    
    func verificaDia(){
        
        //salva o dia da transferencia antiga e quando gerar uma nova, compara com a antiga, se o dia for igual, o limite nao zerou ainda
        if Model.shared.diaTransferencia == nil{
        // usei essa substring pois o NSDate() retorna dia, mes, ano e horario.
            Model.shared.diaTransferencia = NSDate().description[8..<10]
        }
        let dataTransferencia = NSDate().description[8..<10]
        
        if Model.shared.diaTransferencia != dataTransferencia{
            print("transferencia valor zerado")
            Model.shared.valorTransferido = 0
            
        }
        // substitui-se o dia da transferencia antiga pela nova
        Model.shared.diaTransferencia = dataTransferencia
        
    }
    

}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

