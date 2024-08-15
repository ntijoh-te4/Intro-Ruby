require_relative 'spec_helper'

FUNCTION = 'collatz'
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

  it 'returns 1 if input is 1' do
    collatz(1).must_equal 1
  end

  it 'returns 2 if input is 2' do
    collatz(2).must_equal 2
  end

  it 'returns 8 if input is 3' do
    collatz(3).must_equal 8
  end

  it 'returns 3 if input is 4' do
    collatz(4).must_equal 3
  end

  it 'returns 6 if input is 5' do
    collatz(5).must_equal 6
  end

  it 'returns 9 if input is 6' do
    collatz(6).must_equal 9
  end

  it 'returns 17 if input is 7' do
    collatz(7).must_equal 17
  end

  it 'returns 4 if input is 8' do
    collatz(8).must_equal 4
  end

  it 'returns 20 if input is 9' do
    collatz(9).must_equal 20
  end

  it 'returns 7 if input is 10' do
    collatz(10).must_equal 7
  end

  it 'returns 15 if input is 11' do
    collatz(11).must_equal 15
  end

  it 'returns 10 if input is 12' do
    collatz(12).must_equal 10
  end

  it 'returns 10 if input is 13' do
    collatz(13).must_equal 10
  end

  it 'returns 18 if input is 14' do
    collatz(14).must_equal 18
  end

  it 'returns 18 if input is 15' do
    collatz(15).must_equal 18
  end

  it 'returns 5 if input is 16' do
    collatz(16).must_equal 5
  end

  it 'returns 13 if input is 17' do
    collatz(17).must_equal 13
  end

  it 'returns 21 if input is 18' do
    collatz(18).must_equal 21
  end

  it 'returns 21 if input is 19' do
    collatz(19).must_equal 21
  end

  it 'returns 8 if input is 20' do
    collatz(20).must_equal 8
  end

  it 'returns 8 if input is 21' do
    collatz(21).must_equal 8
  end

  it 'returns 16 if input is 22' do
    collatz(22).must_equal 16
  end

  it 'returns 16 if input is 23' do
    collatz(23).must_equal 16
  end

  it 'returns 11 if input is 24' do
    collatz(24).must_equal 11
  end

  it 'returns 24 if input is 25' do
    collatz(25).must_equal 24
  end

  it 'returns 11 if input is 26' do
    collatz(26).must_equal 11
  end

  it 'returns 112 if input is 27' do
    collatz(27).must_equal 112
  end

  it 'returns 19 if input is 28' do
    collatz(28).must_equal 19
  end

  it 'returns 19 if input is 29' do
    collatz(29).must_equal 19
  end

  it 'returns 19 if input is 30' do
    collatz(30).must_equal 19
  end

  it 'returns 107 if input is 31' do
    collatz(31).must_equal 107
  end

  it 'returns 6 if input is 32' do
    collatz(32).must_equal 6
  end

  it 'returns 27 if input is 33' do
    collatz(33).must_equal 27
  end

  it 'returns 14 if input is 34' do
    collatz(34).must_equal 14
  end

  it 'returns 14 if input is 35' do
    collatz(35).must_equal 14
  end

  it 'returns 22 if input is 36' do
    collatz(36).must_equal 22
  end

  it 'returns 22 if input is 37' do
    collatz(37).must_equal 22
  end

  it 'returns 22 if input is 38' do
    collatz(38).must_equal 22
  end

  it 'returns 35 if input is 39' do
    collatz(39).must_equal 35
  end

  it 'returns 9 if input is 40' do
    collatz(40).must_equal 9
  end

  it 'returns 110 if input is 41' do
    collatz(41).must_equal 110
  end

  it 'returns 9 if input is 42' do
    collatz(42).must_equal 9
  end

  it 'returns 30 if input is 43' do
    collatz(43).must_equal 30
  end

  it 'returns 17 if input is 44' do
    collatz(44).must_equal 17
  end

  it 'returns 17 if input is 45' do
    collatz(45).must_equal 17
  end

  it 'returns 17 if input is 46' do
    collatz(46).must_equal 17
  end

  it 'returns 105 if input is 47' do
    collatz(47).must_equal 105
  end

  it 'returns 12 if input is 48' do
    collatz(48).must_equal 12
  end

  it 'returns 25 if input is 49' do
    collatz(49).must_equal 25
  end

  it 'returns 25 if input is 50' do
    collatz(50).must_equal 25
  end

  it 'returns 25 if input is 51' do
    collatz(51).must_equal 25
  end

  it 'returns 12 if input is 52' do
    collatz(52).must_equal 12
  end

  it 'returns 12 if input is 53' do
    collatz(53).must_equal 12
  end

  it 'returns 113 if input is 54' do
    collatz(54).must_equal 113
  end

  it 'returns 113 if input is 55' do
    collatz(55).must_equal 113
  end

  it 'returns 20 if input is 56' do
    collatz(56).must_equal 20
  end

  it 'returns 33 if input is 57' do
    collatz(57).must_equal 33
  end

  it 'returns 20 if input is 58' do
    collatz(58).must_equal 20
  end

  it 'returns 33 if input is 59' do
    collatz(59).must_equal 33
  end

  it 'returns 20 if input is 60' do
    collatz(60).must_equal 20
  end

  it 'returns 20 if input is 61' do
    collatz(61).must_equal 20
  end

  it 'returns 108 if input is 62' do
    collatz(62).must_equal 108
  end

  it 'returns 108 if input is 63' do
    collatz(63).must_equal 108
  end

  it 'returns 7 if input is 64' do
    collatz(64).must_equal 7
  end

  it 'returns 28 if input is 65' do
    collatz(65).must_equal 28
  end

  it 'returns 28 if input is 66' do
    collatz(66).must_equal 28
  end

  it 'returns 28 if input is 67' do
    collatz(67).must_equal 28
  end

  it 'returns 15 if input is 68' do
    collatz(68).must_equal 15
  end

  it 'returns 15 if input is 69' do
    collatz(69).must_equal 15
  end

  it 'returns 15 if input is 70' do
    collatz(70).must_equal 15
  end

  it 'returns 103 if input is 71' do
    collatz(71).must_equal 103
  end

  it 'returns 23 if input is 72' do
    collatz(72).must_equal 23
  end

  it 'returns 116 if input is 73' do
    collatz(73).must_equal 116
  end

  it 'returns 23 if input is 74' do
    collatz(74).must_equal 23
  end

  it 'returns 15 if input is 75' do
    collatz(75).must_equal 15
  end

  it 'returns 23 if input is 76' do
    collatz(76).must_equal 23
  end

  it 'returns 23 if input is 77' do
    collatz(77).must_equal 23
  end

  it 'returns 36 if input is 78' do
    collatz(78).must_equal 36
  end

  it 'returns 36 if input is 79' do
    collatz(79).must_equal 36
  end

  it 'returns 10 if input is 80' do
    collatz(80).must_equal 10
  end

  it 'returns 23 if input is 81' do
    collatz(81).must_equal 23
  end

  it 'returns 111 if input is 82' do
    collatz(82).must_equal 111
  end

  it 'returns 111 if input is 83' do
    collatz(83).must_equal 111
  end

  it 'returns 10 if input is 84' do
    collatz(84).must_equal 10
  end

  it 'returns 10 if input is 85' do
    collatz(85).must_equal 10
  end

  it 'returns 31 if input is 86' do
    collatz(86).must_equal 31
  end

  it 'returns 31 if input is 87' do
    collatz(87).must_equal 31
  end

  it 'returns 18 if input is 88' do
    collatz(88).must_equal 18
  end

  it 'returns 31 if input is 89' do
    collatz(89).must_equal 31
  end

  it 'returns 18 if input is 90' do
    collatz(90).must_equal 18
  end

  it 'returns 93 if input is 91' do
    collatz(91).must_equal 93
  end

  it 'returns 18 if input is 92' do
    collatz(92).must_equal 18
  end

  it 'returns 18 if input is 93' do
    collatz(93).must_equal 18
  end

  it 'returns 106 if input is 94' do
    collatz(94).must_equal 106
  end

  it 'returns 106 if input is 95' do
    collatz(95).must_equal 106
  end

  it 'returns 13 if input is 96' do
    collatz(96).must_equal 13
  end

  it 'returns 119 if input is 97' do
    collatz(97).must_equal 119
  end

  it 'returns 26 if input is 98' do
    collatz(98).must_equal 26
  end

  it 'returns 26 if input is 99' do
    collatz(99).must_equal 26
  end

  it 'returns 26 if input is 100' do
    collatz(100).must_equal 26
  end
end