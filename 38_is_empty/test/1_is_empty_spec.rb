require_relative 'spec_helper'

FUNCTION = 'is_empty'
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

  it 'returnerar true till input []' do
    send(FUNCTION, []).must_equal true
  end

  it 'returnerar false till input ["varmkorv", "senap"]' do
    send(FUNCTION, ["varmkorv", "senap"]).must_equal false
  end

  it 'returnerar false input [nil]' do
    send(FUNCTION, [nil]).must_equal false
  end

end