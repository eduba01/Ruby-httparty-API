def action(table)
    @parameters = table.rows_hash

    puts "\n Printing body \n"
    puts "cupom_xml_payload: \n" + cupom_xml_payload

endpoint    = $api['get_post']

@action = HTTParty.post(
    endpoint,:headers => {"Content-Type" => 'text/xml;charset=UTF-8', "SOAPAction" => 'integrateCouponDu'},
    :body => cupom_xml_payload
    )

#puts @action.code
end

def cupom_xml_payload
    '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:coup="http://www.accurate.com/acec/AcecSOAIntegration/CouponDuServices">
    <soapenv:Header/>
    <soapenv:Body>
       <coup:integrateCouponDuRequest>
          <coup:range>
             <coup:QT>10</coup:QT>
             <coup:RI>0</coup:RI>
             <coup:RF>99</coup:RF>
          </coup:range>
          <!--Optional:-->
          <coup:storeId>TRESC</coup:storeId>
          <!--Optional:-->
          <coup:couponId>?</coup:couponId>
       </coup:integrateCouponDuRequest>
    </soapenv:Body>
 </soapenv:Envelope>'
end