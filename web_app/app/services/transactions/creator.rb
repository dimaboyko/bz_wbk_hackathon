module Transactions
  class Creator
    extend ::Concerns::Performable

    def initialize(contract)
      @contract = contract
    end

    def perform
      friend1 = User.create(name: 'Marcin', available_amount: Random.rand(1_000..5_000))
      friend2 = User.create(name: 'Radek', available_amount: Random.rand(1_000..5_000))
      friend3 = User.create(name: 'Jacek', available_amount: Random.rand(1_000..5_000))

      item1 = OrderItem.find_by_name('Pizza')
      item2 = OrderItem.find_by_name('Guiness')
      item3 = OrderItem.find_by_name('Pilsner')

      friend1.transactions.create(contract_id: contract.id, amount: item1.amount, status: 'FRIEND_FOUND')
      friend2.transactions.create(contract_id: contract.id, amount: item2.amount, status: 'FRIEND_FOUND')
      friend3.transactions.create(contract_id: contract.id, amount: item3.amount, status: 'FRIEND_FOUND')
    end

    private
    attr_accessor :contract
  end
end
