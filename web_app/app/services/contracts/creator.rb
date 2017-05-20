module Contracts
  class Creator
    extend ::Concerns::Performable
    def initialize(client)
      @client = client
    end

    def perform
      #create Order
      order = Order.create

      #create OrderItems
      # po odkomentowaniu trzeba zmienić w Transactions::Creator find-y
      order.order_items.create(name: 'Fries', amount: 10)
      order.order_items.create(name: 'Hamburger', amount: 10)
      order.order_items.create(name: 'Beer', amount: 10)
      order.order_items.create(name: 'Pizza', amount: 30)
      order.update_columns(total_amount: order.order_items.sum(&:amount))

      owner = User.find_by_name('Restauracja')

      #create Contract
      Contract.create!(owner_id: owner.id, client_id: client.id, order_id: order.id, status: 'NEW', total_amount:  order.total_amount, paid_amount: 0)
    end

    private
    attr_reader :client
  end
end
