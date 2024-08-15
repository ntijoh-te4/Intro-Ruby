require_relative 'spec_helper'

FUNCTION = 'average'
ARITY = 1
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

  it 'returnerar 3.0 till input [1, 2, 3, 4, 5]' do
    send(FUNCTION, [1, 2, 3, 4, 5]).must_equal 3.0
  end

  it 'returnerar 1337.0 till input [1337, 1337, 1337]' do
    send(FUNCTION, [1337, 1337, 1337]).must_equal 1337.0
  end

  it 'returnerar fungerande avrundat medelvärde till input [207, -45, 13, -7, 11, 56]' do
    send(FUNCTION, [123, 87, -46]).must_be_within_delta 54.67 , 0.01
  end

end