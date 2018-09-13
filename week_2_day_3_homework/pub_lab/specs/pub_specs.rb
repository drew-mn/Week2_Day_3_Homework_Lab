require("minitest/autorun")
require("minitest/rg")
require_relative("../drink")
require_relative("../customer")
require_relative("../pub")

class TestPub < MiniTest::Test

  def setup

    @customer = Customer.new("Drew", 10.0, 29)
    @customer2 = Customer.new("Neil", 13.5, 15)
    @pub = Pub.new("The Howlin Wolf", 500.0, @drinks, @stock)

    @drink1 = Drink.new("Lager", 3.5, 3.0)
    @drink2 = Drink.new("Coke", 1.2, 0)
    @drink3 = Drink.new("Cider", 2.5, 5.0)
    @drink4 = Drink.new("Ale", 4.0, 3.0)
    @drinks = [@drink1, @drink2, @drink3, @drink4]


    @stock = {@drink1 => 5,
    @drink2 => 10,
    @drink3 => 15,
    @drink4 => 5
  }

  end

  def test_has_name()
    assert_equal("The Howlin Wolf", @pub.name())
  end

  def test_has_money_in_till()
    assert_equal(500.0, @pub.till())
  end

  def test_has_drinks()
    assert_equal(3, @pub.drinks_count())
  end

  def test_has_stock()
    assert_equal(5, @pub.stock_count(@drink4))
  end

  def test_sell_drink()
    @pub.sell_drink(@drink1, @customer)
    assert_equal(3, @pub.drinks_count())
    assert_equal(503.5, @pub.till)
    assert_equal(10.0, @customer2.wallet)
    assert_equal(3.0, @customer2.drunkenness)
  end

  def test_check_customer_over_18_true()
    result = @pub.check_customer_over_18(@customer)
    assert_equal(true, result)
  end

  def test_check_customer_over_18_false()
    result = @pub.check_customer_over_18(@customer2)
    assert_equal(false, result)
  end

  def test_check_drunkenness()
    @pub.sell_drink(@drink3, @customer)
    assert_equal(true, @pub.check_drunkenness(@customer))
  end

  def test_decrease_stock
    @pub.decrease_stock(@drink3)
    assert_equal(14, @pub.stock_count(@drink3))
  end

  def test_value_of_stock

    assert_equal(87, @pub.value_of_stock(@stock))

  end



end
