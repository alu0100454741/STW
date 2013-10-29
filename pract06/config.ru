require './lib/rsack/ppt.rb'

  use Rack::ShowExceptions
  use Rack::Lint
  use Rack::Session::Cookie, 
	  :key => 'rack.session', 
	  :domain => 'example.com',
	  :secret => 'some_secret'
  use Rack::Static, :urls => ['/public']

  run RockPaperScissors::App.new


