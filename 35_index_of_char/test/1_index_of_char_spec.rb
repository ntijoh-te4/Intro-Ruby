require_relative 'spec_helper'

FUNCTION = 'index_of_char'
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

  it 'returns index 0 to input ("hej hopp!", "h")' do
    send(FUNCTION, "hej hopp!", "h").must_equal 0
  end

  it 'returns index 11 to input ("Hello World!", "!")' do
    send(FUNCTION, "Hello World!", "!").must_equal 11
  end

  it 'returns index nil to input ("Hello World", "!")' do
    send(FUNCTION, "Hello World", "!").must_equal nil
  end

  it 'returns index 3 to input ("Give me some coffee", "e")' do
    send(FUNCTION, "Give me some coffee", "e").must_equal 3
  end

end