require_relative 'spec_helper'

FUNCTION = 'smallest_of_three'
ARITY = 3
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
  
  it 'returns the smallest number when the smallest number is first)' do
    smallest_of_three(2,8,19).must_equal 2
  end

  it 'returns the smallest number when the smallest number is last)' do
    smallest_of_three(8,105,2).must_equal 2
  end

  it 'returns the smallest number when the smallest number is second)' do
    smallest_of_three(-800,-1000,200).must_equal -1000
  end
  
  it 'returns either number when all three numbers are of equal size)' do
    smallest_of_three(-8,-8,-8).must_equal -8
  end

  it 'works with three negative numbers)' do
    smallest_of_three(-88,-3,-90).must_equal -90
  end

  it 'works with mix och integers and floats)' do
    smallest_of_three(88.0,3.0,0).must_equal 0
  end

end