Category.destroy_all
Product.destroy_all
User.destroy_all

admin = User.create!(
  name: 'Admin',
  age: '30',
  gender: 'Masculino',
  cpf: '12345678901',
  phone: '12345678901',
  address: 'Rua Admin, 123',
  city: 'Admin',
  state: 'Admin',
  zip_code: '12345678901',
  email: 'admin@mercadoaberto.com',
  password: 'password123',
  password_confirmation: 'password123',
  admin: true
)

user = User.create!(
  name: 'User',
  age: '30',
  gender: 'Masculino',
  cpf: '12345678901',
  phone: '12345678901',
  address: 'Rua User, 123',
  city: 'User',
  state: 'User',
  zip_code: '12345678901',
  email: 'user@mercadoaberto.com',
  password: 'password123',
  password_confirmation: 'password123',
  admin: false
)

eletronicos = Category.create!(name: 'Eletrônicos', description: 'Smartphones, TVs e mais.')
moda = Category.create!(name: 'Moda', description: 'Roupas e acessórios.')
casa = Category.create!(name: 'Casa', description: 'Móveis e decoração.')

Product.create!(
  title: 'Smartphone Galaxy S23',
  description: 'Smartphone com 128GB, 8GB RAM, tela AMOLED.',
  price: 2999.99,
  stock_quantity: 10,
  image_url: 'https://example.com/galaxy_s23.jpg',
  category: eletronicos,
  user: admin
)

Product.create!(
  title: 'Camiseta Polo',
  description: 'Camiseta 100% algodão, tamanho M.',
  price: 79.90,
  stock_quantity: 50,
  image_url: 'https://example.com/polo.jpg',
  category: moda,
  user: admin
)

Product.create!(
  title: 'Sofá 3 Lugares',
  description: 'Sofá confortável para sala de estar.',
  price: 1499.90,
  stock_quantity: 5,
  image_url: 'https://example.com/sofa.jpg',
  category: casa,
  user: admin
)

puts "Seeds criados: #{Category.count} categorias, #{Product.count} produtos, #{User.count} usuários."