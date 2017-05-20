#deletion
Order.delete_all
OrderItem.delete_all
User.delete_all

#create Order
order = Order.create

#create OrderItems
order.order_items.create(name: 'Piwo', amount: 5, quantity: 15)
order.order_items.create(name: 'Golonka', amount: 20, quantity: 4)
order.order_items.create(name: 'Kawa', amount: 10, quantity: 1)
order.order_items.create(name: 'Orzeszki ziemne', amount: 6, quantity: 1)
order.update_columns(total_amount: order.order_items.sum(&:amount))

#create owner & client
owner = User.create(name: 'Restauracja', available_amount: 1000)
client = User.create(name: 'Jacek', available_amount: 500)

#create Contract
Contract.create!(owner_id: owner.id, client_id: client.id, order_id: order.id, status: 'NEW', total_amount:  order.total_amount, paid_amount: 0)
