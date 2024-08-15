require_relative 'spec_helper'

FUNCTION = 'count'
ARITY = 2
PATH = File.join("lib",FUNCTION+".rb")
RELATIVE_PATH = File.join("..", PATH)

describe FUNCTION do
  
  def self.test_order
    :alpha
  end

  it 'exists' do
    assert File.exist?(PATH), "Du behöver skapa filen #{PATH}"
    require_relative RELATIVE_PATH
  end
  
  it "has a function named #{FUNCTION}" do
    assert (stubba_class.__method_exists__?(FUNCTION.to_sym)), "Du behöver definera funktionen #{FUNCTION} i lib/#{FUNCTION}.rb"
  end
  
  it "takes #{ARITY.humanize} argument#{ARITY > 1 ? "s" : ""}" do
    message = "Funktionen #{FUNCTION} måste ta #{ARITY} argument"
    assert_equal ARITY, method(FUNCTION.to_sym).arity, message
  end

  it 'returnerar 3 till input (["ketchup", "ketchup", "senap", "ketchup"],"ketchup")' do
    send(FUNCTION, ["ketchup", "ketchup", "senap", "ketchup"],"ketchup").must_equal 3
  end

  it 'returnerar 0 till input ([2,1,0,88,93], 5)' do
    send(FUNCTION, [2,1,0,88,93], 5).must_equal 0
  end

  it 'returnerar 4 till input ([8, 2, 0, 2, 5, 0, 0, 0], 0)' do
    send(FUNCTION, [8, 2, 0, 2, 5, 0, 0, 0], 0).must_equal 4
  end

  it 'returnerar 0 till input (["ketchup", "ketchup", "senap", "ketchup"],"Ketchup")' do
    send(FUNCTION, ["ketchup", "ketchup", "senap", "ketchup"],"Ketchup").must_equal 0
  end

end