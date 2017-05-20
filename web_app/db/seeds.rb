# 01 http://50cwvb.axshare.com/#g=1&p=01-pusta-lista_1
#create client & owner
User.delete_all
owner = User.create(name: 'Restauracja', available_amount: 1000)
dima = User.create(name: 'Dima', available_amount: 500)

# 02/03 http://50cwvb.axshare.com/#g=1&p=02-powstal-kontrakt-niepotwierdzony_1
Contract.delete_all
Order.delete_all
OrderItem.delete_all
Contracts::Creator.perform(dima)

#04 dzielenie http://50cwvb.axshare.com/#g=1&p=04-kontrakt-dzielenie_1
contract = Contract.last #todo!!!
dima = User.find_by_name('Dima')
item_dima = OrderItem.find_by_name('Hamburger')
dima.transactions.create(contract_id: contract.id, amount: item_dima.amount, status: 'FRIEND_FOUND')

# 05 dodanie ludzi jako |Friend Found| - czyli pokazujemy same imiona, bez kwot  - popup
Transaction.delete_all
contract = Contract.last #todo!!!
Transactions::Creator.perform(contract)

# 06  -lista
# tylko zmiana w widokach

# 07
#iteracja dla każdego przyjaciela
#transaction_id => status zmieniony z :friend_found na :new
#iteracje kończą się widokiem 08


#09 iteracje zmieniające status z :new na :paid

#iteracje koncza  sie 10
puts "Done!"
