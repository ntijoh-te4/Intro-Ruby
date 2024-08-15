require_relative 'spec_helper'

FUNCTION = 'sum_from_to'
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

  it 'returns 1 given 0 & 1 as inputs' do
    sum_from_to(0,1).must_equal 1
  end

  it 'returns 6 given 0 & 3 as inputs' do
    sum_from_to(0,3).must_equal 6
  end


  it 'returns 91806 given 0 & 428 as inputs' do
    sum_from_to(0, 428).must_equal 91806
  end

  it 'returns 91806 given 1 & 428 as inputs' do
    sum_from_to(1, 428).must_equal 91806
  end

  it 'returns 91805 given 2 & 428 as inputs' do
    sum_from_to(2, 428).must_equal 91805
  end

  it 'returns 0 given -428 & 428 as inputs' do
    sum_from_to(-428, 428).must_equal 0
  end

  it 'returns -91806 given -428 & 0 as inputs' do
    sum_from_to(-428, 0).must_equal -91806
  end

  it 'returns x given 3 & -26 as inputs' do
    sum_from_to(3, -26).must_equal -345
  end

end