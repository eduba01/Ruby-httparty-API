class Integracoes 
   require 'httparty'
   require 'site_prism'

   attr_accessor :storeId, :integracao, :endpoint

   def initialize()
      @storeId = ($api['storeId'])
      @integracao = integracao
      @endpoint = endpoint
   end

   def action(integracao)
      @@integracao = integracao
      case integracao 
         when "Insert Order"
            puts integracao
            @@endpoint = "http://ad-#{@storeId}-hcp.infracommerce.com.br/soa-infra/services/default/OrderServices/OrderServices"
            @@int_nome = ($api['isert_order_xml_payload'])
         when "Integrate Order" 
            puts integracao       
            @@endpoint = @endpoint = "http://ad-#{@storeId}-hcp.infracommerce.com.br/soa-infra/services/default/OrderServices/OrderServices" 
            @@int_nome = ($api['isert_order_xml_payload'])
      end
      Integracoes.new.post
   end

   def post()        
      puts "  >> Endpoint:  #{@@endpoint}"
      puts "  >>     Body:  #{@@int_nome}"
         @@action = HTTParty.post(
         @@endpoint,:headers => {"Content-Type" => 'text/xml;charset=UTF-8', "SOAPAction" => 'insertOrder'},
         :body => @@int_nome
         )
         puts "\n  #{@@integracao} - Resposta do Status Code:  " + @@action.code.to_s
         puts "\n  #{@@integracao} - Resposta do Body:  " + @@action.body
   end

   def getcode(var)
       if var == 'code' # Retorna o codigo se "var" for igual a "code"
         var = @@action.code
       elsif var == 'body' # Retorna o codigo se "body" for igual a "body"
         var = @@action.body
       end
   end
     
end