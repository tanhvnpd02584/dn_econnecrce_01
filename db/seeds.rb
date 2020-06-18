# Generate a bunch of additional users.
User.create!(name:  "Hoang Vu Nhat Tan",
 email: "omgod234@gmail.com",
 password: "foobar",
 password_confirmation: "foobar",
 role: true,
 activated: true,
 activated_at: Time.zone.now,
 address: "222 ha Van Tinh, quan lien chieu, TP Da nang",
 phone_number: "0941789420")

# Generate a bunch of additional users.
30.times do |n|
  name = Faker::Name.name
  address = Faker::Address.full_address
  phone_number = Faker::PhoneNumber.phone_number
  email = Faker::Internet.email
  password = "foobar"
  User.create!(name: name,
   email: email,
   password: password,
   password_confirmation: password,
   address: address,
   phone_number: phone_number)
end

# Generate 10 category.
10.times do |n|
  name = Faker::Beer.brand
  Category.create!(
    name: name)
end

# generate bunch of products
categories = Category.all
3.times do |n|
  name = Faker::Beer.name
  unit_price = Faker::Number.decimal(l_digits: 2, r_digits: 3)
  quantity = Faker::Number.within(range: 1..10)
  description = Faker::Beer.style
  categories.each{|category| category.products.create!(
   name: name,
   unit_price: unit_price,
   quantity: quantity,
   description: description)}
end

# generate bunch of purchase
users = User.all
name = Faker::Name.name
address = Faker::Address.full_address
phone_number = Faker::PhoneNumber.phone_number
status  = Faker::Number.within(range: 1..3)
2.times do |n|
  name = Faker::Name.name
  address = Faker::Address.full_address
  phone_number = Faker::PhoneNumber.phone_number
  status  = Faker::Number.within(range: 1..3)
  users.each{|user| user.purchases.create!(
    name: name,
    address: address,
    phone_number: phone_number,
    status: status)}
end
