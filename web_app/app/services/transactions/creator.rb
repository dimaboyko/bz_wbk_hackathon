module Transactions
  class Creator
    extend ::Concerns::Performable

    def initialize(contract)
      @contract = contract
    end

    def perform
      # create Dima transaction
      # dima = User.find_by_name('Dima')
      # item_dima = OrderItem.find_by_name('Hamburger')
      # dima.transactions.create(contract_id: contract.id, amount: 0, status: 'FRIEND_FOUND')

      # create friends transactions
      friend1 = User.create(name: 'Marchin', available_amount: Random.rand(1_000..5_000))
      friend2 = User.create(name: 'Dima', available_amount: Random.rand(1_000..5_000))
      friend3 = User.create(name: 'Radek', available_amount: Random.rand(1_000..5_000))

      friend1.transactions.create(contract_id: contract.id, amount: 0, status: 'FRIEND_FOUND')
      friend2.transactions.create(contract_id: contract.id, amount: 0, status: 'FRIEND_FOUND')
      friend3.transactions.create(contract_id: contract.id, amount: 0, status: 'FRIEND_FOUND')
    end

    private
    attr_accessor :contract
  end
end
