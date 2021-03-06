
require 'pry'

class CashRegister
  attr_accessor :total, :discount, :items, :last_item
  # @@last_item = 0

  def initialize(discount=nil, total=0, items=[])
    @total = total
    @discount = discount
    @items = items
  end

  def add_item(title, price, quantity=1)
    # @@last_item = price * quantity
    self.last_item = price * quantity
    self.total += (price * quantity)
    quantity.times { @items.push(title) }
  end

  def apply_discount
    if @discount
      perc_discount = self.discount / 100.0
      self.total = self.total - (self.total * perc_discount).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  # STILL NEED TO MAKE IT self.total RETURN 0.0
  def void_last_transaction
    void_item = @items.pop(1)
    self.total -= self.last_item
  end

end






# class CashRegister
#     attr_accessor :discount, :total
    
  
#     def initialize(discount = 0)
#       @total = 0
#       @discount = discount
#       @cart = []
#     end
  
#     def add_item(item, price, quantity = 1)
#       item_info = {}
#       item_info[:name] = item
#       item_info[:price] = price
#       item_info[:quantity] = quantity
  
#       @cart << item_info
  
#       @total += price * quantity
  
#     end
  
#     def apply_discount
#       if @discount == 0
#         return "There is no discount to apply."
#       end
#       @total -= @total * @discount / 100
#       return "After the discount, the total comes to $#{@total}."
#     end 
  
#     def items
#       item_names = []
#       @cart.each do | item_info |
#         #test expects product name * quantity...
#         for qty in 1..item_info[:quantity] 
#           item_names << item_info[:name]
#         end 
#       end 
#       item_names
#     end 

#     def void_last_transaction
#     self.items
#     binding.pry
#     end

#   end
  