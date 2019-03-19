#language: pt
#utf-8
@testeXML
	Funcionalidade: teste de XML
		Eu como usuario
		Quero acessar as informações contidas na página de Overview
		Para validar os dados da tela

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

