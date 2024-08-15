require_relative 'spec_helper'

FUNCTION = 'starts_with'
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

  it 'returns true if the first string starts with the supplied character' do
    send(FUNCTION, "Hello", "H").must_equal true
    send(FUNCTION, "hello", "h").must_equal true
  end

  it 'returns false if the first string does not start with the supplied character' do
    send(FUNCTION, "Hello", "h").must_equal false
    send(FUNCTION, "hello", "H").must_equal false
  end

    

end