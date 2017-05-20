class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_user
    User.find_by_name('Dima')
  end
end
