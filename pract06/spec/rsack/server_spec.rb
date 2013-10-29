require 'spec_helper'

describe RockPaperScissors::App do
  #let(:server) { Rack::MockRequest.new(RockPaperScissors::App.new) }
  def server
    Rack::MockRequest.new(Rack::Session::Cookie.new(RockPaperScissors::App.new, :key => 'rack.session', :secret => 'some_secret'))
  end

  context '/' do
    #Se muestra el estado de la pagina 200 es ok
    it "Debería retornar el código 200" do
      response = server.get('/')
      response.status.should == 200
    end

    #Comprueba que en el cuerpo del programa esiste este mensaje
    it "Debería mostrar Bienvenido a Piedra Papel y Tijera" do
      response = server.get('/')
      response.body == 'Bienvenido a, PIEDRA, PAPEL O TIJERA!'
    end

    # it "deberia" do
    #   @prueba.defeat['roca'].should == 'tijeras'
    #   # @frac1.numerador.should_not == 8

    # end

    # it "Test de empatado" do

    #   computer_throw = @throws.sample
      
    #   player_throw = 'roca'
    #   answer = if !@throws.include?(player_throw)
    #     "Seleccione para Empezar"
    #     elsif player_throw == computer_throw
    #       @estadistica['empatar'] = @estadistica['empatar'] + 1
    #       "Ha empatado con el Ordenador"
    #     elsif computer_throw == @defeat[player_throw]
    #       @estadistica['ganar'] = @estadistica['ganar'] + 1
    #       "Bien Hecho => #{player_throw} gana a #{computer_throw}"
    #     else
    #       @estadistica['perder'] = @estadistica['perder'] + 1
    #       "Mala Suerte => #{computer_throw} gana a #{player_throw}"
    #     end
    #     response.body == answer
    # end

  end
end