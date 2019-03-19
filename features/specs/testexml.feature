#language: pt
#utf-8
@testexml
	Funcionalidade: teste de XML
		Eu como usuario
		Quero validar a API de CupomDU 
		Para validar o status code e XML de resposta

@positivo @regressao @EmAndamento12
	Esquema do Cenário: WSDL POST like using Rest
		Dado um WSDL request
      Quando eu enviar parametros com o metodo post e texto com XML
      | cep      | <cep>      |
      | user     | <user>     |
      | password | <password> |
      Então o <status_code> deve retornar 200
 
    Exemplos:
      | cep      | user   | password   | status_code |
      | 04548005 | <user> | <password> | 200         | 

