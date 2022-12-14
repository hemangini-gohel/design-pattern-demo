# Append additional functionality on object

class Burger
  def cost
    50
  end
end

module CheeseBurger
  def cost
    super + 10
  end
end

module LargeBurger
  def cost
    super + 15
  end
end

burger = Burger.new
puts burger.extend(CheeseBurger).cost
puts burger.extend(LargeBurger).cost
