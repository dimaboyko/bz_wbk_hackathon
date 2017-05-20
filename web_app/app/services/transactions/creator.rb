module Transactions
  class Creator
    extend ::Concerns::Performable

    def initialize(params)
      @params = params
    end

    def perform
      transaction.save
    end

    private

    attr_accessor :params

    def transaction
      user.transactions.new(amount: amount, contract: contract)
    end

    def user
      User.find_by(id: params[:user_id])
    end

    def contract
      Contract.find_by(id: params[:contract_id])
    end

    def amount
      params[:amount] || 0
    end
  end
end
