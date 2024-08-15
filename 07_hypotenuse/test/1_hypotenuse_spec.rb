require_relative 'spec_helper'

FUNCTION = 'hypotenuse'
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

  it 'beräknar hypotenusan i trianglar med heltal som katetlängder' do
    hypotenuse(3,4).must_equal 5
    hypotenuse(7,13).must_be_within_delta 14.76 , 0.01
  end

  it 'beräknar hypotenusan i trianglar med decimaltal som katetlängder' do
    hypotenuse(3.0,4.0).must_equal 5.0
    hypotenuse(7.5,13.8).must_be_within_delta 15.70 , 0.01
  end

end