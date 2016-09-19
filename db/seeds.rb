
User.destroy_all


u1 = User.create :name => "Priyanka", :email => "priyanks@ga.co",:password => "chicken", :password_confirmation => "chicken"
u2 = User.create :name => "JongBAE", :email => "jongbae@ga.co", :password => "chicken", :password_confirmation => "chicken"
u3 = User.create :name => "Lucas", :email => "lucas@ga.co", :password => "chicken", :password_confirmation => "chicken"

p "User Count: #{User.all.count} "

Shop.destroy_all

s1 = Shop.create :name => "Sardough Coffee", :description => "It's very good"
s2 = Shop.create :name => "7 eleven ", :description => "It's very cheap "
s3 = Shop.create :name => "Type B ", :description => "Joes Gilfriend Cafe !! "

p "Shops Count: #{Shop.all.count}"

Product.destroy_all

p1 = Product.create :name => "Late", :price => 5, :description => "It's coffe and milk "
p2 = Product.create :name => "Capuccino", :price => 4, :description => "It's coffe and milk and chocollate  "
p3 = Product.create :name => "Sandwich", :price => 9, :description => "Very very expensive !! "

s1.products << p1
s1.products << p2
s1.products << p3


p "Products count: #{Product.all.count}"

Order.destroy_all

o1 = Order.create :name => "FirstOrder"

p "Order count: #{Order.all.count}"

LineItem.destroy_all

l1 = LineItem.create :product_id => p1.id , :order_id => o1.id , :quantity => 5 , :price => (p1.price * 5)


p "LineItem count: #{LineItem.all.count}"
