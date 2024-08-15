require_relative 'spec_helper'

FUNCTION = 'concatenate'
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

  it 'returns a new string consisting of the second string if the first string is empty' do
    send(FUNCTION, "", "world").must_equal "world"
  end

  it 'returns a new string consisting of the first string if the second string is empty' do
    send(FUNCTION, "hello", "").must_equal "hello"
  end

  it 'returns a new empty string if both strings are empty' do
    send(FUNCTION, "", "").must_equal ""
  end

  it 'correctly concatenates and returns a new string when neither string is empty' do
    send(FUNCTION, "hello", "world").must_equal "helloworld"
  end

  it 'does not modify either input string' do
    hello = "hello"
    world = "world"
    send(FUNCTION, hello, world)
    hello.must_equal "hello"
    world.must_equal "world"
  end

    

end