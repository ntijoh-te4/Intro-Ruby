require_relative 'spec_helper'

FUNCTION = 'split_char'
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

  it 'returnerar ["1", "2", "3", "4", "5"] till input ("1;2;3;4;5", ";")' do
    send(FUNCTION, "1;2;3;4;5", ";").must_equal ["1", "2", "3", "4", "5"]
  end

  it 'returnerar ["Hello", "World"] till input ("Hello World", " ")' do
    send(FUNCTION, "Hello World", " ").must_equal ["Hello", "World"]
  end

  it 'returnerar ["This is a line", "this is another line", "this is a line too"] till input ("This is a line\nthis is another line\nthis is a line too", "\n")' do
    send(FUNCTION, "This is a line\nthis is another line\nthis is a line too", "\n").must_equal ["This is a line", "this is another line", "this is a line too"]
  end

  it 'returnerar ["Varmkorvmedketchup"] till input ("Varmkorvmedketchup", " ")' do
    send(FUNCTION, "Varmkorvmedketchup", " ").must_equal ["Varmkorvmedketchup"]
  end

  it 'returnerar ["a", "b", "c"] till input ("ambmcm", "m")' do
    send(FUNCTION, "ambmcm", "m").must_equal ["a", "b", "c"]
  end

end