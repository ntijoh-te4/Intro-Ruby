require_relative 'spec_helper'

FUNCTION = 'sum_to_with_step'
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

  it 'Returnerar summan 20 till input (8,2)' do
    sum_to_with_step(8,2).must_equal 20
  end

  it 'Returnerar summan 70 till input (30,7)' do
    sum_to_with_step(30,7).must_equal 70
  end

  it 'Returnerar summan 1683 till input (100,3)' do
    sum_to_with_step(100,3).must_equal 1683
  end


end