class ApplicationController < ActionController::Base
  protect_from_forgery
  #before_filter :auth

  private
  # def auth
    # authenticate_or_request_with_http_basic do |user, pass|
      # user == 'leeno-member' && pass == '831mogumogu'
    # end
  # end
end
