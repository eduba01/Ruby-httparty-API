# encoding: utf-8  
# !/usr/bin/env ruby 


##################### INICIO XML Teste XML ##########################################

  Dado("um WSDL request") do
	puts "\n ... \n"
  end
  
  Quando("eu enviar parametros com o metodo post e texto com XML") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
	  action(table)
  end
   
  Então("o {int} deve retornar 200") do |status_code|
	  puts "\n\nResposta do status code: " + @action.code.to_s
	  puts ""
	  puts "\n\nResposta do body: \n"
	  puts @action.body
	  @action.code.should be status_code
	  #@action.code.should be 200
  end
  
  ##################### FIM XML Teste XML ##########################################

Dado("que eu queira recuperar um post") do
	puts "INICIANDO RECUPERAÇÃO DO POST, ID 2"	
end
 
Quando("o método for get com um id existente") do
  	get_post
end


Então("me retorna o status 200 com o response body equivalente") do

	expect(@procurar_post.code).to eq 200

  	@parse_post = JSON.parse(@procurar_post.body, object_class: OpenStruct)
  	expect(@parse_post.title).to eq "qui est esse"

  	puts "\n\nPRINTANDO O TITULO DO POST\n\n"
  	puts @parse_post.title

end
