class Customer

  attr_reader :name, :age
  attr_accessor :wallet, :drunkenness

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunkenness = 0.0
  end

  def pay_for_drink(drink)
    @wallet -= drink.price
  end

  def increase_drunkenness(drink)
    @drunkenness += drink.alcohol_level()
  end

  def decrease_drunkenness(food)
    @drunkenness -= food.rejuvenation_level
  end


end
