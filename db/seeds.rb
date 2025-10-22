# Veritabanını temizle
OrderItem.destroy_all
Order.destroy_all
Product.destroy_all
Category.destroy_all
User.destroy_all

# Kullanıcılar
users = [
  { name: 'Ahmet Yılmaz', email: 'ahmet@example.com' },
  { name: 'Ayşe Demir', email: 'ayse@example.com' },
  { name: 'Mehmet Kaya', email: 'mehmet@example.com' }
]

users.each { |user| User.create!(user) }
puts "#{User.count} kullanıcı oluşturuldu"

# Kategoriler
categories = [
  { name: 'Elektronik', description: 'Elektronik ürünler' },
  { name: 'Kitap', description: 'Kitaplar ve dergiler' },
  { name: 'Giyim', description: 'Giyim ve aksesuar' }
]

categories.each { |category| Category.create!(category) }
puts "#{Category.count} kategori oluşturuldu"

# Ürünler
elektronik = Category.find_by(name: 'Elektronik')
kitap = Category.find_by(name: 'Kitap')
giyim = Category.find_by(name: 'Giyim')

products = [
  { name: 'Laptop', description: 'Gaming laptop', price: 15000, category: elektronik, stock: 10 },
  { name: 'Mouse', description: 'Wireless mouse', price: 250, category: elektronik, stock: 50 },
  { name: 'Ruby Programlama', description: 'Ruby kitabı', price: 150, category: kitap, stock: 30 },
  { name: 'Rails Guide', description: 'Rails öğrenme kitabı', price: 200, category: kitap, stock: 25 },
  { name: 'Tişört', description: 'Pamuklu tişört', price: 100, category: giyim, stock: 100 }
]

products.each { |product| Product.create!(product) }
puts "#{Product.count} ürün oluşturuldu"

# Siparişler
user1 = User.first
order1 = Order.create!(user: user1, status: 'pending')

laptop = Product.find_by(name: 'Laptop')
mouse = Product.find_by(name: 'Mouse')

OrderItem.create!(order: order1, product: laptop, quantity: 1, price: laptop.price)
OrderItem.create!(order: order1, product: mouse, quantity: 2, price: mouse.price)

order1.save
puts "#{Order.count} sipariş oluşturuldu"
puts "#{OrderItem.count} sipariş kalemi oluşturuldu"