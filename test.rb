require 'minitest/autorun'

require './1.4-ATM-classes-master/classes/machine'
require './1.4-ATM-classes-master/classes/user'
require './1.4-ATM-classes-master/classes/program'
require './1.4-ATM-classes-master/classes/App'

# test can withdraw
# withdraw a positive amount
# withdraw a negative amount
# withdraw an amount < balance
# withdraw amount > balance
# withdraw amount > atm balance
# withdraw amount < atm balance
#.stub for gets.chomp

class TestUser < MiniTest::Unit::TestCase
  def setup
    @user = User.new
    @user.balance = 1000
  end

  def test_can_withdraw
    assert_equal true, @user.can_withdraw?(400)
  end

  def test_can_withdraw_negative
    assert_equal false, @user.can_withdraw?(-400)
  end

  def test_can_withdraw_more_than_balance
    assert_equal false, @user.can_withdraw?(1400)
  end

  def test_deduct_ability
    assert_equal 0, @user.deduct(1000)
  end

  def test_withdraw_empty_amount
    assert_raises(ArgumentError) { @user.can_withdraw?() } 
  end

  def test_can_withdraw_not_a_fixnum
    assert_raises(ArgumentError) { @user.can_withdraw?('twss') }
  end
end

class TestMachine < MiniTest::Unit::TestCase
  def setup
    @machine = Machine.new
    @machine.balance = 20000
  end

  def test_can_withdraw
    assert_equal true, @machine.can_withdraw?(500)
  end

  def test_can_withdraw_negative
    assert_equal false, @machine.can_withdraw?(-400)
  end

  def test_can_withdraw_more_than_balance
    assert_equal false, @machine.can_withdraw?(24000)
  end

  def withdraw_no_amount
    assert_equal false, @machine.test_can_withdraw(0)
  end

  def test_deduct_ability
    assert_equal 1000, @machine.deduct(19000)
  end

  def test_withdraw_empty_amount
    assert_raises(ArgumentError) { @machine.can_withdraw?() } 
  end

  def test_can_withdraw_not_a_fixnum
    assert_raises(ArgumentError) { @machine.can_withdraw?('twss') }
  end
end

# Test each method
# does program run
# get input 
# does main menu select 1 

class TestProgram < MiniTest::Unit::TestCase
  def setup
    @program = Program.new
    @balance = 20000
    @atm = Machine.new
    @user = User.new
  end

  def test_run
  #   out, _ = capture_io do
  #     @program.run
  #   end
  #     assert_match /bad MACHINE/i, out
  # end

  def error_msg
    out, _ = capture_io do
      @program.display_error
    end
      assert_match /bad MACHINE/i, out
  end
# captures strings in console and assigns to out. out matches "bad MACHINE"

  def skip (reason to skip)
  end



  # Time.stub :now, Time.at(0) do
  # assert obj_under_test.stale?
  # end
end

#do not touch put:
# private or .abs - absolute value
