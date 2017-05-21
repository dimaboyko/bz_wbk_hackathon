module Api
  module V1
    class AlexaIntegrationController < BaseController
      def create_contract
        Contracts::Creator.perform(current_user)
        render json: { status: :ok }, status: :ok
      end

      def split_the_bill
        contract = Contract.last
        Transactions::Creator.perform(contract)
        render json: { status: :ok }, status: :ok

      end

      def match_product
        client = User.find_by_name(params[:client])
        order_item = OrderItem.find_by_name(params[:item].capitalize)
        OrderItemAssigner.perform(client: client, order_item: order_item)
      end

      def ping_phones

        Transaction.update_all(status: "PAYMENT_REQUESTED")
        render json: { status: :ok }, status: :ok
      end
    end
  end
end
