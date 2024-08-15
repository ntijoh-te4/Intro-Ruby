require_relative 'spec_helper'

FUNCTION = 'count_even'
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

  it 'Returnerar 3 till input 4' do
    count_even(4).must_equal 3
  end

  it 'Returnerar 1 till input 0' do
    count_even(0).must_equal 1
  end

  it 'Returnerar 6 till input 10' do
    count_even(10).must_equal 6
  end

  it 'Returnerar 251 till input 500' do
    count_even(500).must_equal 251
  end

  it 'Returnerar 220307 till input 440613' do
    count_even(440613).must_equal 220307
  end



end