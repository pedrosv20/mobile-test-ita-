# mobile-test-itau
Esse aplicativo foi desenvolvido para a vaga mobile/ios do Itaú.
# Escolhas feitas
Criei um modelo de dados json dentro do swift chamado Dados, para simular a conexão com a internet buscando dados por uma API.
 
No model, optei por deixar o dinheiro da conta corrente e poupança volta para o inicial toda vez que a pessoa abre novamente o app para ser mais fácil de testar, já o valor Transferido limite de 10 mil fica salvo no UserDefaults.

A ViewController inicial foi criada somente para simular uma tela inicial e resgatar os dados do arquivo json.

Os testes foram feitos no arquivo mobile-test-itauTests para verificar entradas de dados do usuario e mostrar que o valor limite é
zerado. Quando a pessoa clica para fazer uma transferência, o dia da mesma é salvo e em uma próxima transferência é comparado com o dia salvo, se forem diferentes o valor limite é zerado.

## Feedback são bem vindos.
