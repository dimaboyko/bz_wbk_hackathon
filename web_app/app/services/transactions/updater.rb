module Transactions
  class Updater
    extend ::Concerns::Performable
    include ::Concerns::Transactionable

    def initialize(params)
      @params = params
    end

    def perform
      in_transaction do
        transaction.amount += amount
        transaction.status = status
        transaction.save

        contract.paid_amount += amount
        contract.save
      end
    end

    private

    attr_accessor :params

    delegate :contract, to: :transaction

    def transaction
      @transaction ||= Transaction.find_by(id: params[:id])
    end

    def amount
      params[:amount] || 0
    end
  end
end
