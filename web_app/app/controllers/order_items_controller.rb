class OrderItemsController < ApplicationController
  #respond_to :js

  # POST
  def assign
    @client = User.find(params[:client_id])
    @order_item = OrderItem.find(params[:order_item_id])

    OrderItemAssigner.perform(client: @client, order_item: @order_item)
  end
end
