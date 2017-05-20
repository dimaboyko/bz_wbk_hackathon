class OrderItemsController < ApplicationController
  #respond_to :js

  # POST
  def assign
    client = User.find_by_name('Marcin')
    order_item = OrderItem.find_by_name('Pizza')

    OrderItemAssigner.perform(client: client, order_item: order_item)

    contract = Contract.last # tmp
    redirect_to contract_path(contract)
  end
end
