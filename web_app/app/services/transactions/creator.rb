module Transactions
  class Creator
    extend ::Concerns::Performable

    def initialize(contract)
      @contract = contract
    end

    def perform
      # create Dima transaction
      dima = User.find_by_name('Dima')
      item_dima = OrderItem.find_by_name('Hamburger')
      dima.transactions.create(contract_id: contract.id, amount: 0, status: 'FRIEND_FOUND', name: item_dima.name)

      # create friends transactions
      friend1 = User.create(name: 'Marcin', available_amount: Random.rand(1_000..5_000))
      friend2 = User.create(name: 'Radek', available_amount: Random.rand(1_000..5_000))
      friend3 = User.create(name: 'Jacek', available_amount: Random.rand(1_000..5_000))

      item1 = OrderItem.find_by_name('Pizza')
      item2 = OrderItem.find_by_name('Guiness')
      item3 = OrderItem.find_by_name('Pilsner')

      friend1.transactions.create(contract_id: contract.id, amount: 0, status: 'FRIEND_FOUND', name: item1.name)
      friend2.transactions.create(contract_id: contract.id, amount: 0, status: 'FRIEND_FOUND', name: item2.name)
      friend3.transactions.create(contract_id: contract.id, amount: 0, status: 'FRIEND_FOUND', name: item3.name)
    end

    private
    attr_accessor :contract
  end
end
