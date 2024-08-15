require_relative 'spec_helper'

FUNCTION = 'is_odd'
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

  
  it 'returns false for input (8)' do
    is_odd(8).must_equal false
  end

  it 'returns false for input (-248.0)' do
    is_odd(-248).must_equal false
  end
  
  it 'returns true for input (4501)' do
    is_odd(4501).must_equal true
  end

  it 'returns false for input (0)' do
    is_odd(0).must_equal false
  end

end