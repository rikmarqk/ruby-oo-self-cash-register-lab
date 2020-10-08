require 'pry'
class CashRegister

    attr_accessor :total, :discount, :items, :last_price
    attr_reader :last_price, :last_quantity

    def initialize(discount = 0)
        @total=0
        @discount = discount;
        @items = [];
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity;
        quantity.times {@items << title};

        @last_price = price;
        @last_quantity = quantity;
    end

    def apply_discount
        if self.discount > 0 then
            @total -= (@total * (self.discount/100.0)).to_i;
            return "After the discount, the total comes to $#{@total}."
        end
        "There is no discount to apply."
    end

    def void_last_transaction
        @total -= @last_price * @last_quantity
        @last_quantity.times {@items.delete_at(-1)}
    end

end