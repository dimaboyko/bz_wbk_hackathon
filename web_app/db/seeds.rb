# create Order
Order.delete_all

order = Order.create

# create OrderItems
OrderItem.delete_all

order_1 = order.order_items.create(name: 'Piwo', amount: 5, quantity: 1)
order_2 = order.order_items.create(name: 'Golonka', amount: 20, quantity: 1)
order_3 = order.order_items.create(name: 'Kawa', amount: 10, quantity: 1)
order_4 = order.order_items.create(name: 'Orzeszki ziemne', amount: 6, quantity: 1)
order.update_columns(total_amount: order.order_items.sum(&:amount))

# create owner & client
# id: nil, name: nil, available_amount: "500"
User.delete_all

user_1 = User.create(name: 'Dima', available_amount: Random.rand(1_000..5_000))
user_2 = User.create(name: 'Marcin', available_amount: Random.rand(1_000..5_000))
user_3 = User.create(name: 'Radek', available_amount: Random.rand(1_000..5_000))
user_4 = User.create(name: 'Jacek', available_amount: Random.rand(1_000..5_000))

owner = User.create(name: 'Restauracja', available_amount: 1000)
client = user_1

# create Contract
Contract.delete_all

contract = Contract.create!(owner_id: owner.id, client_id: client.id,
  order_id: order.id, status: 'NEW', total_amount:  order.total_amount, paid_amount: 0)

# create transactions
# user_id: nil, contract_id: nil, amount: 0, created_at: nil, updated_at: nil, status: nil
Transaction.delete_all

user_1.transactions.create(contract_id: contract.id, amount: order_1.amount, status: 'NEW')
user_2.transactions.create(contract_id: contract.id, amount: order_2.amount, status: 'NEW')
user_3.transactions.create(contract_id: contract.id, amount: order_3.amount, status: 'NEW')
user_4.transactions.create(contract_id: contract.id, amount: order_4.amount, status: 'NEW')
