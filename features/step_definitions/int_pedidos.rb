# encoding: utf-8  
# !/usr/bin/env ruby 
 
##################### INICIO XML Teste XML ##########################################
  Dado("que queira executar a integracao") do
		puts "\n ... \n"
  end
 
  Quando("eu executar a insersão de pedidos {string}") do |integracao|
		# table is a Cucumber::MultilineArgument::DataTable
		Integracoes.new.action(integracao)
  end
  
  Quando("eu executar a integração de pedidos {string}") do |integracao|
		Integracoes.new.action(integracao)
  end
 
  Então("o status_code deve retornar 200") do 
	  action = Integracoes.new.getcode('code')
	  puts "\n Status code: #{action}" 
	  action.should be 200
	  action = Integracoes.new.getcode('body')
	  puts " Response Body: #{action}" 
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
	binding.pry
	@parse_post = JSON.parse(@procurar_post.body, object_class: OpenStruct)
	binding.pry
  	expect(@parse_post.title).to eq "qui est esse"

  	puts "\n\nPRINTANDO O TITULO DO POST\n\n"
  	puts @parse_post.title

end
