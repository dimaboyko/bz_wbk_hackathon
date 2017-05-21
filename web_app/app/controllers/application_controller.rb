class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate

  private

  def current_user
    User.find_by_name('Dima')
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == 'cola' && password == 'cao'
    end
  end
end
