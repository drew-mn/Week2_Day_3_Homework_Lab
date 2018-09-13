require("minitest/autorun")
require("minitest/rg")
require_relative("../drink")
require_relative("../customer")
require_relative("../food")

class TestCustomer < MiniTest::Test

  def setup()

  @drink1 = Drink.new("Lager", 3.5, 3.0)
  @drink2 = Drink.new("Coke", 1.2, 0)
  @drink3 = Drink.new("Cider", 2.5, 5.0)
  @drink4 = Drink.new("Ale", 4.0, 3.0)

  @food = Food.new("chicken wings", 4.0, 5.0)

  @customer = Customer.new("Neil", 13.5, 23)
  @drinks = [@drink1, @drink2, @drink3, @drink4]
    end

  def test_has_name()
    assert_equal("Neil", @customer.name())
  end

  def test_has_price()
    assert_equal(13.5, @customer.wallet())
  end

  def test_has_age()
    assert_equal(23, @customer.age())
  end

  def test_drunkenness_starts_at_zero()
    assert_equal(0.0, @customer.drunkenness())
  end

  def test_pay_for_drink
    @customer.pay_for_drink(@drink1)
    assert_equal(10.0, @customer.wallet)
  end

  def test_drunkenness_goes_up()
    @customer.increase_drunkenness(@drink1)
    assert_equal(3.0, @customer.drunkenness())
  end

  def test_drunkeness_after_eating
    @customer.increase_drunkenness(@drink3)
    @customer.decrease_drunkenness(@food)
    assert_equal(0, @customer.drunkenness)

end


end
