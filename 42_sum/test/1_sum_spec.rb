require_relative 'spec_helper'

FUNCTION = 'sum'
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

  it 'returnerar 15 till input [1, 2, 3, 4, 5]' do
    send(FUNCTION, [1, 2, 3, 4, 5]).must_equal 15
  end

  it 'returnerar 4011 till input [1337, 1337, 1337]' do
    send(FUNCTION, [1337, 1337, 1337]).must_equal 4011
  end

  it 'returnerar -2145394 till input [-2150714, 9558, -4741, -38, 0, 541]' do
    send(FUNCTION, [-2150714, 9558, -4741, -38, 0, 541]).must_equal -2145394
  end

end