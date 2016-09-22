
User.destroy_all

u1 = User.create name: 'Priyanka', email: 'priyanks@ga.co', password: 'chicken', password_confirmation: 'chicken'
u2 = User.create name: 'JongBAE', email: 'jongbae@ga.co', password: 'chicken', password_confirmation: 'chicken', admin: true
u3 = User.create name: 'Lucas', email: 'lucas@ga.co', password: 'chicken', password_confirmation: 'chicken'
u4 = User.create name: 'Andrew', email: 'andrew@ga.co', password: 'chicken', password_confirmation: 'chicken'
u5 = User.create name: 'Jack', email: 'jack@ga.co', password: 'chicken', password_confirmation: 'chicken'
u6 = User.create name: 'Badger', email: 'badger@ga.co', password: 'chicken', password_confirmation: 'chicken'
u7 = User.create name: 'Arpan', email: 'arpan@ga.co', password: 'chicken', password_confirmation: 'chicken'
u8 = User.create name: 'Ymay', email: 'ymay@ga.co', password: 'chicken', password_confirmation: 'chicken'
u9 = User.create name: 'Howie', email: 'howie@ga.co', password: 'chicken', password_confirmation: 'chicken'
u10 = User.create name: 'Samit', email: 'samit@ga.co', password: 'chicken', password_confirmation: 'chicken'
u11 = User.create name: 'Steve', email: 'steve@ga.co', password: 'chicken', password_confirmation: 'chicken'
u12 = User.create name: 'Peter', email: 'peter@ga.co', password: 'chicken', password_confirmation: 'chicken'
u13 = User.create name: 'Tom', email: 'tom@ga.co', password: 'chicken', password_confirmation: 'chicken'
u14 = User.create name: 'Roma', email: 'roma@ga.co', password: 'chicken', password_confirmation: 'chicken'
u15 = User.create name: 'Kristy', email: 'kristy@ga.co', password: 'chicken', password_confirmation: 'chicken'
u16 = User.create name: 'Jessica', email: 'jessica@ga.co', password: 'chicken', password_confirmation: 'chicken'
u17 = User.create name: 'Katarina', email: 'katarina@ga.co', password: 'chicken', password_confirmation: 'chicken'
u18 = User.create name: 'Meghan', email: 'meghan@ga.co', password: 'chicken', password_confirmation: 'chicken'
u19 = User.create name: 'Jerry', email: 'jerry@ga.co', password: 'chicken', password_confirmation: 'chicken'
u20 = User.create name: 'Emliy', email: 'emliy@ga.co', password: 'chicken', password_confirmation: 'chicken'
u21 = User.create name: 'Grace', email: 'grace@ga.co', password: 'chicken', password_confirmation: 'chicken'
u22 = User.create name: 'Zara', email: 'zara@ga.co', password: 'chicken', password_confirmation: 'chicken'
u23 = User.create name: 'Lily', email: 'lily@ga.co', password: 'chicken', password_confirmation: 'chicken'
u24 = User.create name: 'Lucy', email: 'lucy@ga.co', password: 'chicken', password_confirmation: 'chicken'
u25 = User.create name: 'Eva', email: 'eva@ga.co', password: 'chicken', password_confirmation: 'chicken'
u26 = User.create name: 'Sophia', email: 'sophia@ga.co', password: 'chicken', password_confirmation: 'chicken'
u27 = User.create name: 'Alice', email: 'alice@ga.co', password: 'chicken', password_confirmation: 'chicken'
u28 = User.create name: 'Poppy', email: 'poppy@ga.co', password: 'chicken', password_confirmation: 'chicken'
u29 = User.create name: 'Aria', email: 'aria@ga.co', password: 'chicken', password_confirmation: 'chicken'
u30 = User.create name: 'Holly', email: 'hooly@ga.co', password: 'chicken', password_confirmation: 'chicken'

p "User Count: #{User.all.count} "


Shop.destroy_all


s1 = Shop.create name: 'The Fine Food Store ', description: "When it comes to family, actions speak louder than words. We care about our extended families \u2013 our customers, staff, suppliers and community. We are involved, engaged and we always behave with integrity.", image: 'http://res.cloudinary.com/dvhmkrgs2/image/upload/v1474325016/6d68bbd502a2dbbcde2d44b4af84b1ed_ksxswl.jpg', :latlng => "-33.8584025,151.2064343"

s2 = Shop.create name: 'Hunter Connection International Food Court', description: 'our menu is versatile and constantly evolving, embracing the best of regional and rural cuisines to satisfy even the most discerning of palates.  ', image: 'http://res.cloudinary.com/dvhmkrgs2/image/upload/v1474325030/ultimo-coffee_q5c15s.jpg',:latlng => "-33.9290013,151.0839231"

s3 = Shop.create :name => "The Fine Food Store ", :description => "When it comes to family, actions speak louder than words. We care about our extended families – our customers, staff, suppliers and community. We are involved, engaged and we always behave with integrity." ,:image => "http://res.cloudinary.com/dvhmkrgs2/image/upload/v1474325016/6d68bbd502a2dbbcde2d44b4af84b1ed_ksxswl.jpg", :latlng => "-33.8660109, 151.2054294"

s4 = Shop.create :name => "Hunter Connection International Food Court", :description => "our menu is versatile and constantly evolving, embracing the best of regional and rural cuisines to satisfy even the most discerning of palates.  " ,:image => "http://res.cloudinary.com/dvhmkrgs2/image/upload/v1474325030/ultimo-coffee_q5c15s.jpg", :latlng => "-33.9522219,151.0687776"

s5 = Shop.create :name => "Westpac Place Food Court", :description => "THIS FOOD COURT SHOP IS LOCATED IN THE EXTREMELY BUSY WESTPAC PLACE WITH SOME 6500 EMPLOYEES JUST IN THE BUILIDNG ABOVE. " ,:image => "http://res.cloudinary.com/dvhmkrgs2/image/upload/v1474325024/cabukee-counter_kqvvgl.png", :latlng => "-33.8194717,150.9376019"

p "Shops Count: #{Shop.all.count}"

Product.destroy_all

p1 = Product.create name: 'Meat Pie', price: 5, description: 'A meat pie is a pie with a filling of meat and often other savory ingredients.  ', image: 'http://res.cloudinary.com/dvhmkrgs2/image/upload/v1474327302/0b8c3cdf67e5044cb640c8fa4464edf4_vx2ajg.jpg'
p2 = Product.create name: 'Pavlova', price: 4, description: 'It is a meringue dessert with a crisp crust and soft, light inside, usually topped with fruit and,  whipped cream ', image: 'http://res.cloudinary.com/dvhmkrgs2/image/upload/v1474327311/0723b338d9fa70d5a92ee496034c9b61_opu65z.jpg'
p3 = Product.create name: 'Cinco De Chicka Salad', price: 9, description: 'Mexican chicken salad, mixed and cos lettuce, black beans, capsicum, char grilled corn, avocado, baked tortilla chips and lime pesto vinaigrette. ', image: 'http://res.cloudinary.com/dvhmkrgs2/image/upload/v1474420052/f4d0d62cbaaf7b3eee5c00aff8bec931_se7ccc.jpg'
p4 = Product.create name: 'Moodle Salad', price: 11, description: 'Grilled beef, soba noodle salad, mixed lettuce, steamed edamame, avocado, cucumber, black sesame seeds and sesame seed dressing. ', image: 'http://res.cloudinary.com/dvhmkrgs2/image/upload/v1474420092/b5c093e719bff7678cecfcbe6578b1ce_zkkzgi.jpg'
p5 = Product.create name: 'Buddha Bowl Salad (VG)', price: 12, description: 'Kale, quinoa, roasted pumpkin, sweet potato, broccoli, Spanish onion, black bean, hummus and turmeric tahini dressing with gluten free falafel. ', image: 'http://res.cloudinary.com/dvhmkrgs2/image/upload/v1474420116/8c1df536750195780dcc0f9cae5c4a05_fil7ig.jpg'
p6 = Product.create name: 'The Hulk', price: 13, description: 'Kiwi, baby spinach, kale, super greens powder, chia, raw honey and almond milk. ', image: 'http://res.cloudinary.com/dvhmkrgs2/image/upload/v1474420085/b4010c11f71af15169ba8b9426cd490f_eddjmm.jpg'
p7 = Product.create name: 'Almighty Acai', price: 7, description: "Frozen acai, banana, mixed berries, vanilla protein and coconut water.
 ", image: 'http://res.cloudinary.com/dvhmkrgs2/image/upload/v1474420105/53a6dbcb78694342d396d853f92bcda1_qeoqlb.jpg'
p8 = Product.create name: 'LAMINGTON', price: 8, description: 'made from squares of sponge cake coated in an outer layer of chocolate (or sometimes raspberry) sauce and rolled in desiccated coconut.', image: 'http://res.cloudinary.com/dvhmkrgs2/image/upload/v1474420463/recipe-lab-kale-caesar-superJumbo_omn8kp.jpg'
p9 = Product.create name: 'BURGERS', price: 10, description: 'served with cheese, lettuce, tomato, bacon, onion, pickles, and condiments such as mustard, mayonnaise, ketchup, relish, and chiles. ', image: 'http://res.cloudinary.com/dvhmkrgs2/image/upload/v1474508307/lamington-sponge-cake_coj9xg.jpg'
p10 = Product.create name: 'SAUSAGE ROLLS', price: 13, description: 'A sausage roll is a British savoury pastry snack, popular in Commonwealth nations and beyond. They are sold at retail outlets and are also available from bakeries as a take-away food.', image: 'http://res.cloudinary.com/dvhmkrgs2/image/upload/v1474508262/SausageRolls1_o59yxz.jpg'
p11 = Product.create name: 'STEAK', price: 8, description: 'A steak is a meat generally sliced perpendicular to the muscle fibers, potentially including a bone. ', image: 'http://res.cloudinary.com/dvhmkrgs2/image/upload/v1474508288/steak-alamy_vqhzms.jpg'
p12 = Product.create name: 'DIM SUM', price: 9, description: 'prepared as small bite-sized portions of food served in small steamer baskets or on small plates. ', image: 'http://res.cloudinary.com/dvhmkrgs2/image/upload/v1474508255/yum_yum_nnogy1.jpg'
p13 = Product.create name: 'POTATO CAKES', price: 6, description: 'Potato pancakes are shallow-fried pancakes of grated or ground potato, flour and egg, often flavored with grated garlic or onion and seasoning. ', image: 'http://res.cloudinary.com/dvhmkrgs2/image/upload/v1474508263/Potato-Cake_8696_h45grk.jpg'
p14 = Product.create name: 'FISH AND CHIPS', price: 7, description: 'Fish and chips is a hot dish of English origin consisting of fried battered fish and hot chips', image: 'http://res.cloudinary.com/dvhmkrgs2/image/upload/v1474508355/slide-fish-chips-2015_xla4nv.jpg'
p15 = Product.create name: 'Neenish tart', price: 5, description: 'A neenish tart (or neenish cake) is a tart made with a pastry base and a filling consisting of sweet gelatine-set cream, mock cream, icing sugar paste, or lemon and sweetened condensed milk mixture, with dried icing on the top of the tart in two colours.', image: 'http://res.cloudinary.com/dvhmkrgs2/image/upload/v1474508277/neenish-tarts-hp_qrxebi.jpg'

s1.products << p1
s1.products << p2
s1.products << p3
s1.products << p4
s1.products << p5


s2.products << p6
s2.products << p7
s2.products << p8
s2.products << p9
s2.products << p10

s3.products << p11
s3.products << p12
s3.products << p13
s3.products << p14
s3.products << p15
p "Products count: #{Product.all.count}"

Order.destroy_all

o1 = Order.create name: u1.name+Time.now.to_s, user_id: u1.id
o2 = Order.create name: u1.name+Time.now.to_s, user_id: u1.id
o3 = Order.create name: u1.name+Time.now.to_s, user_id: u1.id
o4 = Order.create name: u1.name+Time.now.to_s, user_id: u1.id
o5 = Order.create name: u1.name+Time.now.to_s, user_id: u1.id

o6 = Order.create name: u2.name+Time.now.to_s, user_id: u2.id
o7 = Order.create name: u2.name+Time.now.to_s, user_id: u2.id
o8 = Order.create name: u2.name+Time.now.to_s, user_id: u2.id
o9 = Order.create name: u2.name+Time.now.to_s, user_id: u2.id
o10 = Order.create name: u2.name+Time.now.to_s, user_id: u2.id

o11 = Order.create name: u3.name+Time.now.to_s, user_id: u3.id
o12 = Order.create name: u3.name+Time.now.to_s, user_id: u3.id
o13 = Order.create name: u3.name+Time.now.to_s, user_id: u3.id
o14 = Order.create name: u3.name+Time.now.to_s, user_id: u3.id
o15 = Order.create name: u3.name+Time.now.to_s, user_id: u3.id




p "Order count: #{Order.all.count}"

LineItem.destroy_all

l1 = LineItem.create product_id: p1.id, order_id: o1.id, quantity: 5, price: (p1.price * 5)
l2 = LineItem.create product_id: p1.id, order_id: o1.id, quantity: 5, price: (p1.price * 5)
l3 = LineItem.create product_id: p1.id, order_id: o1.id, quantity: 5, price: (p1.price * 5)
l4 = LineItem.create product_id: p1.id, order_id: o1.id, quantity: 5, price: (p1.price * 5)
l5 = LineItem.create product_id: p1.id, order_id: o1.id, quantity: 5, price: (p1.price * 5)
l6 = LineItem.create product_id: p1.id, order_id: o1.id, quantity: 5, price: (p1.price * 5)

p "LineItem count: #{LineItem.all.count}"

o1.line_items << l1
o1.line_items << l2
o2.line_items << l3
o2.line_items << l4
o3.line_items << l5
o3.line_items << l6
