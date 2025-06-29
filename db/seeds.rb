Transaction.destroy_all
Product.destroy_all
Company.destroy_all


companies = Company.create!([
  { name: "Tech Solutions", address: "123 Tech Lane", image_url: "https://example.com/tech-solutions.jpg" },
  { name: "Green Grocers", address: "456 Green St", image_url: "https://example.com/green-grocers.jpg" },
  { name: "Fashion Hub", address: "789 Fashion Ave", image_url: "https://example.com/fashion-hub.jpg" },
  { name: "Book Haven", address: "321 Book Rd", image_url: "https://example.com/book-haven.jpg" },
  { name: "Gadget World", address: "654 Gadget Blvd", image_url: "https://example.com/gadget-world.jpg" }
])


products = Product.create!([
  { name: "Laptop", image_url: "https://example.com/laptop.jpg", company: companies[0] },
  { name: "Smartphone", image_url: "https://example.com/smartphone.jpg", company: companies[0] },
  { name: "Organic Apples", image_url: "https://example.com/organic-apples.jpg", company: companies[1] },
  { name: "Fresh Carrots", image_url: "https://example.com/fresh-carrots.jpg", company: companies[1] },
  { name: "Designer Dress", image_url: "https://example.com/designer-dress.jpg", company: companies[2] },
  { name: "Casual Shoes", image_url: "https://example.com/casual-shoes.jpg", company: companies[2] },
  { name: "Mystery Novel", image_url: "https://example.com/mystery-novel.jpg", company: companies[3] },
  { name: "Science Fiction Book", image_url: "https://example.com/science-fiction-book.jpg", company: companies[3] },
  { name: "Smartwatch", image_url: "https://example.com/smartwatch.jpg", company: companies[4] },
  { name: "Bluetooth Headphones", image_url: "https://example.com/bluetooth-headphones.jpg", company: companies[4] }
])


Transaction.create!([
  { pricePerUnit: 1000, quantity: 2, expenses: 50, product: products[0], company: companies[0] },
  { pricePerUnit: 800, quantity: 3, expenses: 30, product: products[1], company: companies[0] },
  { pricePerUnit: 2, quantity: 100, expenses: 10, product: products[2], company: companies[1] },
  { pricePerUnit: 1.5, quantity: 200, expenses: 5, product: products[3], company: companies[1] },
  { pricePerUnit: 150, quantity: 1, expenses: 20, product: products[4], company: companies[2] },
  { pricePerUnit: 80, quantity: 2, expenses: 15, product: products[5], company: companies[2] },
  { pricePerUnit: 10, quantity: 50, expenses: 2, product: products[6], company: companies[3] },
  { pricePerUnit: 12, quantity: 30, expenses: 3, product: products[7], company: companies[3] },
  { pricePerUnit: 200, quantity: 1, expenses: 25, product: products[8], company: companies[4] },
  { pricePerUnit: 150, quantity: 2, expenses: 10, product: products[9], company: companies[4] }
])
