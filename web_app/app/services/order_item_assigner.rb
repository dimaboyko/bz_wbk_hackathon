class OrderItemAssigner
  extend ::Concerns::Performable

  def initialize(client:, order_item:)
    @client = client
    @order_item = order_item
  end

  def perform
    transaction.update_attributes(
      amount: order_item.amount,
      name: order_item.name,
      status: 'NEW'
    )
  end

  private
  attr_reader :client, :order_item

  def transaction
    # TODO jak powiązać transakcje klienta z danym queue item???
    # na razie jest na sztywno przez nazwe
    @transaction ||= @client.transactions.last
  end
end
