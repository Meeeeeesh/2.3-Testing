require 'minitest/autorun'

require './1.4-ATM-classes-master/classes/machine'
require './1.4-ATM-classes-master/classes/user'
require './1.4-ATM-classes-master/classes/program'
require './1.4-ATM-classes-master/classes/App'

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

class TestProgram < MiniTest::Unit::TestCase
  def setup
    @program = Program.new
    @balance = 20000
    @atm = Machine.new
    @user = User.new
  end

  def test_run
    out, _ = capture_io do
      @prog.stub(:get_menu_selection, 3) do
        @program.run
    end
      assert_match /bad MACHINE/i, out
      assert_match /exit atm/i, out
  end

  def test_greeting_exit
    out, _ = capture_io do
      @program.stub(:get_menu_selection, 4) do 
        @program.run
      end
    end
    assert_match /welcome/i, out
    assert_match /exit/i, oit
  end

  def test_menu_error_msg
    menu_test = ["1", "2", "3"]
    respond = ""
    out, _ = capture_io do
      @program.stub(:chomp, 1) do
        respond = @program.get_menu_selection(test_menu)
      end
    end
      assert_equal 3, respond
      assert_match "1\n2\n3\n>>", out
  end

  def test_enter_option
    respond = ''
    out, _ = capture_io do
      @program.stub(:chomp, 'test') do
        respond = @program.get_option('test')
      end
    end 
    assert_match 'testprompt\n>> \n', out
    assert_match 'testrespond', respond  
  end

  def test_exit_program
    @program.exit_program = true
    assert_equal true, @program.exit_program
  end

  def test_failed_menu_exit
    assert_equal false, @program.exit_program
  end

  def test_get_user_valid
    test_user = {name: "Meeesh", pin: "6789"}
    out, _ = capture_io do
      @program.get_user(test_user)
    end
    assert_include out, "Welcome, you baller."
  end

  def test_user_valid
    test_user = {name: "Meeesh", pin: "3333"}
    out, _ = capture_io do
      @program.get_user(test_user)
    end
    assert_include out, "Tibby is trying to steal money to get more bones"
  end
  def test_null_user
    test_user = {name: nil, pin: nil}
    out, _ = capture_io do
      @program.get_user(test_user)
    end
    assert_include out, "Nope, not even a little bit."
  end
  def test_menu_error
    out, _ = capture_io do
      @program.stub(:get_menu_selection, 7) do
        @program.show_account_menu
      end
    end
    assert_include out, "Who are you and what have you done with Meesh"
  end
  def test_account_options
    out, _ = capture_io do
      @program.stub(:get_menu_selection, 1)
        @program.show_account_menu
      end
    end
    assert_equal "Current balance is all the money in the world, just kidding. It's $1000".strip, out.strip
  end













