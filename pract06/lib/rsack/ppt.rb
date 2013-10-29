require 'rack/request'
require 'rack/response'
require 'haml'
 
module RockPaperScissors
  class App

    def set_env(env)
      @env = env
      @session = env['rack.session']
    end

    def some_key 
      return @session['some_key'].to_i if @session['some_key']
      @session['some_key'] = 0
    end

    def some_key=(value)
      @session['some_key'] = value
    end

#Iicializacion del entorno
    def initialize(app = nil)
      @app = app
      @content_type = :html
      @defeat = {'roca' => 'tijeras', 'papel' => 'roca', 'tijeras' => 'papel'}
      @throws = @defeat.keys
      @estadistica = {'empatar' => 0, 'ganar' => 0, 'perder' => 0}
    end


#Función que
    def call(env)
      set_env(env)
      req = Rack::Request.new(env)  
      req.env.keys.sort.each { |x| puts "#{x} => #{req.env[x]}" }  

      computer_throw = @throws.sample
      player_throw = req.GET["choice"]
      answer = if !@throws.include?(player_throw)
        "Seleccione para Empezar"
        elsif player_throw == computer_throw
          @estadistica['empatar'] = @estadistica['empatar'] + 1
          "Ha empatado con el Ordenador"
        elsif computer_throw == @defeat[player_throw]
          @estadistica['ganar'] = @estadistica['ganar'] + 1
          "Bien Hecho => #{player_throw} gana a #{computer_throw}"
        else
          @estadistica['perder'] = @estadistica['perder'] + 1
          "Mala Suerte => #{computer_throw} gana a #{player_throw}"
        end 

      engine = Haml::Engine.new File.open("views/index3.haml").read
      res = Rack::Response.new
      
      self.some_key = self.some_key + 1 if req.path == '/'
      res.write engine.render({}, 
        :estadistica => @estadistica,
        :answer => answer, 
        :throws => @throws,
        :player_throw => player_throw, 
        :computer_throw => computer_throw,
        :some_key => some_key)
      res.finish
    end # call
  end   # App
end     # RockPaperScissors

