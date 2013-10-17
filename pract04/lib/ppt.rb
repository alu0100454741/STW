require 'rack/request'
require 'rack/response'
require 'haml'
 
module RockPaperScissors
  class App 

#Iicializacion del entorno
    def initialize(app = nil)
      @app = app
      @content_type = :html
      @defeat = {'roca' => 'tijeras', 'papel' => 'roca', 'tijeras' => 'papel'}
      @throws = @defeat.keys
    end


#Función que
    def call(env)
      req = Rack::Request.new(env)  
      req.env.keys.sort.each { |x| puts "#{x} => #{req.env[x]}" }  
      computer_throw = @throws.sample
      player_throw = req.GET["choice"]
      answer = if !@throws.include?(player_throw)
        "Seleccione para Empezar"
        elsif player_throw == computer_throw
          "Ha empatado con el Ordenador"
        elsif computer_throw == @defeat[player_throw]
          "Bien Hecho => #{player_throw} gana a #{computer_throw}"
        else
          "Mala Suerte => #{computer_throw} gana a #{player_throw}"
        end

      engine = Haml::Engine.new File.open("views/index2.haml").read
      res = Rack::Response.new
      res.write engine.render({}, 
        :answer => answer, 
        :throws => @throws,
        :player_throw => player_throw, 
        :computer_throw => computer_throw)
      res.finish
    end # call
  end   # App
end     # RockPaperScissors

