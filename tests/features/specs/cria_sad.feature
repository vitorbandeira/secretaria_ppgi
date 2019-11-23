#language: pt

Funcionalidade: Inserir os dados no banco ja existentes

# sad feature para insercao de dados


Cenario: Inserção de dados já existentes no banco 
Dado que tem-se  informações a inserir 
Quando  insere-se "Funcionario3" e "Proativo!" 
Entao não deve ser possível efetuar a ação, pois já existe tais dados no banco
E receber o seguinte aviso "já está em uso"