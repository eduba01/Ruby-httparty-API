#language: pt
#utf-8
@testexml
	Funcionalidade: teste de XML
		Eu como usuario
		Quero validar a API de CupomDU 
		Para validar o status code e XML de resposta

@positivo @regressao @integracoes
	Cenário: Executar a integracao Insert Order
		Dado que queira executar a integracao
    Quando eu executar a insersão de pedidos "Insert Order"
    Então o status_code deve retornar 200

@positivo @regressao @integracoes
	Cenário: Executar a integracao Integrate Order
		Dado que queira executar a integracao
    Quando eu executar a integração de pedidos "Integrate Order"
    Então o status_code deve retornar 200 

