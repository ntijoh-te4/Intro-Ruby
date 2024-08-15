require_relative 'spec_helper'

FUNCTION = 'is_divisible_by'
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

  
  it 'returns true for input (8,2)' do
    is_divisible_by(8,2).must_equal true
  end

  it 'returns false for input (2,8)' do
    is_divisible_by(2,8).must_equal false
  end
  
  it 'returns true for input (213912,-3)' do
    is_divisible_by(213912,-3).must_equal true
  end

  it 'returns true for input (0,"random_input")' do
    random_input = rand(1..10_000)
    is_divisible_by(0,random_input).must_equal true
  end

end