require_relative('./PizzaOrder.rb')



order1 = PizzaOrder.new({first_name: "Tracy", last_name: "Steinberg", topping: "Mushroom", quantity: 1 })

order1.save

order1.first_name = "Guy"
order1.update