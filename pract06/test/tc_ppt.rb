require "test/unit"
require "rack/test"
require "rsack"

class PPTTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Rack::Builder.new do
      use(Rack::Session::Cookie, {:key => 'rack.session', :secret => 'some_secret'})
      run RockPaperScissors::App.new
    end.to_app
  end
   
  def test_index
    get "/"
    assert last_response.ok?
  end

  def test_body
    get "/"
    assert last_response.body.include? ("Bienvenido a, PIEDRA, PAPEL O TIJERA!")
  end
  
  def test_title
    get "/"
    assert_match "<title>Juego - PPT</title>", last_response.body
  end

  def test_rock
    get "/?choice=Piedra"
    assert last_response.ok?
  end
  
  def test_paper
    get "/?choice=Papel"
    assert last_response.ok?
  end
  
  def test_scissors
    get "/?choice=Tijera"
    assert last_response.ok?
  end
end