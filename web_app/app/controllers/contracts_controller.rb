class ContractsController < ApplicationController

  respond_to :html, :js
  before_action :set_contract, only: [:show, :edit, :update, :destroy]

  def index
    redirect_to contract_path(100)
  end

  def show
    respond_with @contract
  end

  def edit
    respond_with @contract
  end

  def create
    contract = Contracts::Creator.perform(current_user)
    redirect_to contract_path(contract)
  end

  def update
    @contract.update(contract_params)
    respond_with @contract
  end

  def destroy
    @contract.destroy
    respond_with @contract.destroy
  end

  private

  def set_contract
    @contract = Contract.last
  end

  def contract_params
    params[:contract].permit(:owner_id, :client_id, :status, :total_amount, :paid_amount)
  end
end
