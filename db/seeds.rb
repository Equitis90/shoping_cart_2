OrderItem.delete_all
Order.delete_all

ProductType.delete_all
ProductType.create! id:1, title: 'Coffee'
ProductType.create! id:2, title: 'Tea'

Product.delete_all
Product.create! id: 1, name: "Black tea", price: 2.55, active: true, product_type_id: 2
Product.create! id: 2, name: "Green tea", price: 1.29, active: true, product_type_id: 2
Product.create! id: 3, name: "Arabica coffee", price: 1.99, active: true, product_type_id: 1

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"
