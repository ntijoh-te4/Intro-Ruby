require_relative 'spec_helper'

FUNCTION = 'nth_character'
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

  it 'returns nil if position is 0' do
    send(FUNCTION, "string", 0).must_equal nil
  end

  it 'returns the first character if position is 1' do
    send(FUNCTION, "ABCDEFG", 1).must_equal "A"
    send(FUNCTION, "GHIJKLM", 1).must_equal "G"
  end

  it 'returns the 3rd character if position is 3' do
    send(FUNCTION, "ABCDEFG", 3).must_equal "C"
    send(FUNCTION, "GHIJKLM", 3).must_equal "I"
  end

  it 'returns nil if the string is empty' do
    send(FUNCTION, "", 0).must_equal nil
    send(FUNCTION, "", 1).must_equal nil
    send(FUNCTION, "", 3).must_equal nil
  end

end