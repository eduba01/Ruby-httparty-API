#language: pt
Funcionalidade: Apenas um cenario

@get
Cenario: Get Simples
    
    Dado que eu queira recuperar um post
    Quando o método for get com um id existente
    Então me retorna o status 200 com o response body equivalente