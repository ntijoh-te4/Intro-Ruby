require_relative 'spec_helper'

FUNCTION = 'smallest_of_two'
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
  
  it 'returns the smallest number when the smallest number is first)' do
    smallest_of_two(2,8).must_equal 2
  end

  it 'returns the smallest number when the smallest number is last)' do
    smallest_of_two(8,2).must_equal 2
  end
  
  it 'returns either number when both numbers are of equal size)' do
    smallest_of_two(2,2).must_equal 2
  end

  it 'works with negative numbers)' do
    smallest_of_two(-88,3).must_equal -88
  end

  it 'works with mix och integers and floats)' do
    smallest_of_two(-88.0,3).must_equal -88.0
  end

end