require_relative 'spec_helper'

FUNCTION = 'insertion_sort'
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

  it 'returnerar [-7, 0, 2, 5] till input [0, 5, -7, 2]' do
    send(FUNCTION, [0, 5, -7, 2]).must_equal [-7, 0, 2, 5]
  end
  
  it 'returnerar en sorterad array till en array med 100 slumpvis valda nummer' do
    random_array = Array.new(100) { rand(1...1000) }
    random_array_sorted = random_array.sort
    send(FUNCTION, random_array).must_equal random_array_sorted
  end

end

