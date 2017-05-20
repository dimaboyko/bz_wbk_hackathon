module Api
  module V1
    class StatusController < BaseController
      def check
        #curl -H "X-Api-Key: mochila" http://localhost:3000/api/v1/status.json
        render json: { status: :ok }, status: :ok
      end
    end
  end
end
