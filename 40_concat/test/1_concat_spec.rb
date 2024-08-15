require_relative 'spec_helper'

FUNCTION = 'concat'
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

  it 'returnerar ["senap", "ketchup", "varmkorv", "bostongurka"] till input (["senap", "ketchup"], ["varmkorv", "bostongurka"])' do
    send(FUNCTION, ["senap", "ketchup"], ["varmkorv", "bostongurka"]).must_equal ["senap", "ketchup", "varmkorv", "bostongurka"]
  end

  it 'returnerar [2,4,78,98,11] till input ([2,4], [78,98,11])' do
    send(FUNCTION, [2,4], [78,98,11]).must_equal [2,4,78,98,11]
  end

  it 'returnerar [2,4] till input ([2,4], [])' do
    send(FUNCTION, [2,4], []).must_equal [2,4]
  end

  it 'returnerar [10, 10, 10, 11, 11, 11] till input ([10, 10, 10], [11, 11, 11])' do
    send(FUNCTION, [10, 10, 10], [11, 11, 11]).must_equal [10, 10, 10, 11, 11, 11]
  end

end