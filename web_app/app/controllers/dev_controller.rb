class DevController < ApplicationController
  def reset
    FlowHandler.reset!
    redirect_to contracts_path
  end

  def reload
    @contract = Contract.last
  end
end
