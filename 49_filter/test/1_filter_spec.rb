require_relative 'spec_helper'

FUNCTION = 'filter'
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

  it 'returnerar [2, 2] till input ([8, 2, 0, 2, 5], 2)' do
    send(FUNCTION, [8, 2, 0, 2, 5], 2).must_equal [2, 2]
  end
  
  it 'returnerar [] till input ([8, 2, 0, 2, 5], "2")' do
    send(FUNCTION, [8, 2, 0, 2, 5], "2").must_equal []
  end

  it 'returnerar ["olof", "olof", "olof"] till input (["bosse", "olof", "olof", "kalle", "olof"], "olof")' do
    send(FUNCTION, ["bosse", "olof", "olof", "kalle", "olof"], "olof").must_equal ["olof", "olof", "olof"]
  end

end