class TransactionsController < ApplicationController
  #respond_to :js

  # POST
  def create
    @contract = Contract.last #todo!!!
    ::Transactions::Creator.perform(@contract)
    @transactions = @contract.transactions
  end

  # PATCH
  def update # {id: 4, amount: -20,  status: 'NEW'}
   # ::Transactions::Updater.perform(transaction_params)
  end

  def sent
    Transaction.update_all(status: "PAYMENT_REQUESTED")
    @contract = Contract.last #todo!!!
    @transactions = @contract.transactions
    render :create
  end

  def confirm
    Transaction.update_all(status: "PAID")
    @contract = Contract.last #todo!!!
    @transactions = @contract.transactions
    render :create
  end
end
