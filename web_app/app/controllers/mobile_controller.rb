class MobileController < ApplicationController
  respond_to :html, :js


  def show
    @user = User.find_by_name(params[:username].capitalize)
    @transaction = @user.transactions.where(status: "PAYMENT_REQUESTED").last if @user
    respond_with @transaction
  end

  def pay
    @transaction =Transaction.find(params[:id])
    @transaction.update_attributes(status: "PAID")
    redirect_to show_mobile_path(username: @transaction.user.name)
  end
end
