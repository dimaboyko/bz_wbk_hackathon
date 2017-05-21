module Api
  module V1
    class AlexaIntegrationController < BaseController
      def create_contract
        Contracts::Creator.perform(current_user)
        broadcast!
        render json: { status: :ok }, status: :ok
      end

      def split_the_bill
        contract = Contract.last
        Transactions::Creator.perform(contract)
        broadcast!
        render json: { status: :ok }, status: :ok
      end

      def match_product
        client = User.find_by_name(params[:client])
        order_item = OrderItem.find_by_name(params[:item].capitalize)
        broadcast!
        OrderItemAssigner.perform(client: client, order_item: order_item)
      end

      def ping_phones
        Transaction.update_all(status: "PAYMENT_REQUESTED")
        broadcast!
        render json: { status: :ok }, status: :ok
      end

      private

      def broadcast!
        ActionCable.server.broadcast 'documents', message: 'ok'
      end
    end
  end
end
