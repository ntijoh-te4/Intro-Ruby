require_relative 'spec_helper'

FUNCTION = 'is_negative'
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

  it 'returns true for negative numbers' do
    is_negative(-3).must_equal true
    random_negative_number = rand(1..1000) * - 1
    is_negative(random_negative_number).must_equal true
  end

  it 'returns false for positive numbers' do
    is_negative(783).must_equal false
    random_positive_number = rand(1..1000)
    is_negative(random_positive_number).must_equal false
  end

  it 'returns false for zero' do
    is_negative(0).must_equal false
  end

end