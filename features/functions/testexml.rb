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
      case integracao 
         when "Insert Order"
            puts integracao
            @@endpoint = "http://ad-#{@storeId}-hcp.infracommerce.com.br/soa-infra/services/default/OrderServices/OrderServices"
            #@@integracao = self.insert_order_xml_payload    
            @@integracao = ($api['isert_order_xml_payload'])
         when "Integrate Order"        
            @@endpoint = @endpoint = "http://ad-#{@storeId}-hcp.infracommerce.com.br/soa-infra/services/default/OrderServices/OrderServices"
           #@@integracao = self.insert_order_xml_payload    
           @@integracao = ($api['isert_order_xml_payload'])
      end
      Integracoes.new.post
   end

   def post()        
      puts @@endpoint
      puts @@integracao
        @@action = HTTParty.post(
         @@endpoint,:headers => {"Content-Type" => 'text/xml;charset=UTF-8', "SOAPAction" => 'insertOrder'},
        :body => @@integracao
        )
        puts "\n INSERT ORDER \n" + @@action.code.to_s
        puts "\n INSERT ORDER \n" + @@action.body
     end

     def getcode()
       $code = @@action.code
     end
end