require 'rack'
require 'twitter'
require './configure'

class Twittapp

  def call env
    req = Rack::Request.new(env)
    res = Rack::Response.new 
    res['Content-Type'] = 'text/html'
    username = (req["user"] && req["user"] != '') ? req["user"] :''
    user_tweets = (!username.empty?) ? usuario_registrado?(username) : ''
    res.write <<-"EOS"
      <html>
        <body>
          <h1>Twitter</h1>
          <form action="/" method="post">
            Nombre de usuario: <input type="text" name="user" autofocus>
            <br>
            <input type="submit" value="Enviar">
          </form>
	  <br>
          <h4>ULTIMO TWEET:</h4>
	  <hr>
          Usuario: #{username}
	  <br>
          Ultimo tweet: #{user_tweets}
          <hr>
        </body>
      </html>
    EOS
    res.finish
  end

  def usuario_registrado?(user)
    begin
    	Twitter.user_timeline(user).first.text
    	rescue
      	"Este usuario no tiene cuenta en Twitter"
    end
  end
end

Rack::Server.start(
  :app => Twittapp.new,
  :Port => 8080,
  :server => 'thin'
)
