require( 'pg' )
# require_relative('../db/pizza_order.sql')

class PizzaOrder

attr_accessor :first_name, :last_name, :topping, :quantity
attr_reader :id

  def initialize( order_details )
    @id = order_details["id"] if(order_details["id"] != nil)
    @first_name = order_details[:first_name]
    @last_name = order_details[:last_name]
    @topping = order_details[:topping]
    @quantity = order_details[:quantity].to_i
  end

  def save()
    db = PG.connect( { dbname: 'pizza_shop', host: 'localhost'} )
    sql = 
    "INSERT INTO pizza_orders
    (first_name, last_name, topping, quantity) 
    VALUES 
    ('#{@first_name}', '#{@last_name}', '#{@topping}', #{@quantity}) 
    RETURNING id;"
    @id = db.exec(sql)[0]["id"].to_i
    db.close
  end

  def update()
    db = PG.connect( { dbname:  'pizza_shop', host:  'localhost'})
    sql = 
    "UPDATE 
    pizza_orders 
    SET 
    first_name = '#{@first_name}', 
    last_name = '#{@last_name}', 
    topping = '#{@topping}', 
    quantity = #{@quantity}
    WHERE 
    id = #{@id};"
    db.exec(sql)
    db.close
   end



end

