require_relative 'spec_helper'

FUNCTION = 'subtract'
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

  it 'subtracts two positive integers' do
    subtract(1,2).must_equal -1
    subtract(2,1).must_equal 1
    subtract(2,3).must_equal -1
    subtract(13,37).must_equal -24
  end

  it 'subtracts negative integers' do
    subtract(-1,2).must_equal -3
    subtract(2,-1).must_equal 3
    subtract(-2,-3).must_equal 1
  end


end