def get_post()

  @id                    = "2"

	endpoint               = $api['get_post']
  mount                  = endpoint.gsub("<id>", @id)

  binding.pry
  @procurar_post = HTTParty.get(mount,:headers => {"Content-Type" => 'application/json'})
  puts "\n\nPRINTANDO ENPOINT\n\n"
  puts (mount)

  puts "\n\nIMPRIMINDO RESULTADO DA CONSULTA\n\n"
  puts @procurar_post.body
  puts @procurar_post.code
    case @procurar_post.code
      when 200
        puts "ok"
      when 404
        puts "não existe"
      when 400
        puts "problema de negócio"
      when 500...600
        puts "ops #{@procurar_post.code}"
    end

end