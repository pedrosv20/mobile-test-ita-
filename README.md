# mobile-test-itau
Esse aplicativo foi desenvolvido para a vaga mobile/ios do Itaú.
# Escolhas feitas
Criei um modelo de dados json dentro do swift chamado Dados, para simular a conexão com a internet buscando dados por uma API.
O nome de usuario não é usado no app porém em uma aplicação maior, seria, então optei por colocá-lo nos dados.
 
No model, optei por deixar o dinheiro da conta corrente e poupança voltar para o inicial resgatado pelos dados do json, toda vez que a pessoa fecha e abre novamente o app para ser mais fácil de testar, já o valor Transferido limite de 10 mil fica salvo no UserDefaults tanto como o dia da última transferência.

A ViewController inicial foi criada somente para simular uma tela inicial e resgatar os dados do arquivo json.

Na TransferenciaTableViewController criei um array (["de: ", "para: "]) para serem o título das duas sections criadas na tableView. A variável selecionado foi usada para somente permitir o usuário ir para o pagamento quando já tivesse selecionado uma conta.

Na PagamentoViewController criei uma função chamada atualizaValores, para inserir os dados na tela, de usuário selecionado, conta selecionada e o valor disponível. A função confirmaPagamento para verificar se a pessoa possui o dinheiro disponível para transferir e retirar o dinheiro da conta após fazer as devidas verificações. E a função verificaDia que é chamada sempre que o usuário clica no botão confirmar, sempre que uma transferência é feita o dia em que ela foi feita fica salvo, entao é comparado com o dia atual e se forem diferentes o valor limite de transferência é zerado, sendo assim, somente permitido transferir R$ 10.000 por dia.

Os testes foram feitos no arquivo mobile-test-itauTests para verificar entradas de dados do usuário e mostrar que o valor limite é
zerado. Quando a pessoa clica para fazer uma transferência, o dia da mesma é salvo e em uma próxima transferência é comparado com o dia salvo, se forem diferentes o valor limite é zerado.

## Feedback são bem vindos.
