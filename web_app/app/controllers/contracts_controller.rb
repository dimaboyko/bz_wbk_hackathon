class ContractsController < ApplicationController

  respond_to :html, :js
  before_action :set_contract, only: [:show, :edit, :update, :destroy]

  def index
    respond_with @contracts = Contract.all
  end

  def show
    respond_with @contract
  end

  def edit
    respond_with @contract
  end

  def create
    respond_with @contract = Contract.create(contract_params)
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
    # @contract = Contract.find(params[:id])
    @contract = Contract.find(1)
  end

  def contract_params
    params[:contract].permit(:owner_id, :client_id, :status, :total_amount, :paid_amount)
  end
end
