require './lib/rsack/ppt.rb'

builder = Rack::Builder.new do
  use Rack::Static, :urls => ['/public']
  use Rack::ShowExceptions
  use Rack::Lint
  use Rack::Session::Cookie, 
      :key => 'rack.session', 
      :domain => 'localhost:8080',
      :secret => 'some_secret'

  run RockPaperScissors::App.new
end

Rack::Handler::Thin.run builder