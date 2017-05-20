class TransactionsController < ApplicationController
  respond_to :js

  # POST
  def create # {user_id: 1, contract_id: 1, amount: 100}
    ::Transactions::Creator.perform(transaction_params)
  end

  # PATCH
  def update # {id: 4, amount: -20,  status: 'NEW'}
    ::Transactions::Updater.perform(transaction_params)
  end

  private

  def transaction_params
    params.require(:transaction).permit(:id, :contract_id, :user_id, :amount)
  end
end
