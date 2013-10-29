#modulo para hacer las pruebas de RSPEC
module Rsack
  class Server
    def call(env)
      #["200", {}, "hello"]
      response = Rack::Response.new
      response.write("¡Hola Mundo!")
      response.finish
    end
  end
endS