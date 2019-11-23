

#language: pt

Funcionalidade: Inserir os dados no banco 


Cenario: Inserção de um novo dados no banco com sucesso
Dado que acesso o banco e tem-se  informações a inserir
Quando  insere-se "Funcionario3" e "Proativo!" 
Entao deve inserir com sucesso os dados no banco
E receber a seguinte mensagem "Attendance was successfully created."


