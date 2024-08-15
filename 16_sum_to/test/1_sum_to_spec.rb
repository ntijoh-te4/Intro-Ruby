require_relative 'spec_helper'

FUNCTION = 'sum_to'
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

  it 'Returnerar summan 6 till input 3' do
    sum_to(3).must_equal 6
  end

  it 'Returnerar summan 1 till input 1' do
    sum_to(1).must_equal 1
  end

  it 'Returnerar summan 91806 till input 428' do
    sum_to(428).must_equal 91806
  end



end