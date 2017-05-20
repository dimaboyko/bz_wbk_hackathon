class DevController < ApplicationController
  def reset
    FlowHandler.reset!
    redirect_to contracts_path
  end
end
