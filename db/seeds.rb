# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.last.orders.create(orders: [{:product_name=>"Pizza", :quantity=>1, :price=>125.0}, {:total_price=>140.00, :tax=>15.00}], created_at:Date.today-2, updated_at:Date.today-2)

User.last.products.find_by(product_name:"Pizza").product_solds.create(
product_name: "Pizza",
price: 125.0,
quantity: 1,
tax: 15.0,
total_price: 140.0,
created_at:Date.today-2,
updated_at:Date.today-2

)