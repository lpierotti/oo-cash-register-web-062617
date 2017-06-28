require "pry"
class CashRegister

	attr_accessor :total, :last_transaction

	def initialize(discount = nil)
		@total = 0
		@discount = discount
		@items = []
	end

	def discount 
		@discount
	end

	def add_item(title, price, quantity = 1)
		@total += price * quantity
		
		quantity.times do 
			@items << title
		end
		@last_transaction = price * quantity
	end

	def items
		@items
	end

	def apply_discount
		if @discount
			@total = @total - @total * (@discount / 100.0)
			#binding.pry
			"After the discount, the total comes to $#{@total.to_i}."
		else
			"There is no discount to apply."
		end
	end

	def void_last_transaction
		@total -= @last_transaction
	end
end
