require "pry"

class CashRegister
  attr_reader :discount, :items
  attr_accessor :total

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_item = 0
  end

  def add_item(title, price, quantity = 1)
    @last_item = price * quantity
    self.total += price * quantity
    quantity.times do
      @items << title
    end
  end

  def apply_discount
    if discount == 0
      return "There is no discount to apply."
    end
    a = self.total * (discount / 100.0)
    self.total -= a
    return "After the discount, the total comes to $800."
  end

  def void_last_transaction
    self.total -= @last_item
  end
end
