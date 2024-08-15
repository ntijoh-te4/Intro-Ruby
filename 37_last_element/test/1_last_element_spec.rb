require_relative 'spec_helper'

FUNCTION = 'last_element'
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

  it 'returnerar elementet "varmkorv" till input ["senap", "ketchup", "varmkorv"]' do
    send(FUNCTION, ["senap", "ketchup", "varmkorv"]).must_equal "varmkorv"
  end

  it 'returnerar elementet [1,2,55,11] till input [55, 0, [1,2,55,11]]' do
    send(FUNCTION, [55, 0, [1,2,55,11]]).must_equal [1,2,55,11]
  end

  it 'returnerar elementet nil till input [788, 55, nil]' do
    send(FUNCTION, [788, 55, nil]).must_equal nil
  end

end