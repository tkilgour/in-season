class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

    def cart
      # value = cookies[:cart] || JSON.generate({})
      @cart ||= cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
    end
    helper_method :cart

    def update_cart(new_cart)
      cookies[:cart] = {
        value: JSON.generate(new_cart),
        expires: 10.days.from_now
      }
      cookies[:cart]
    end

    def current_user
      @current_user = User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user

    def authorize
      redirect_to '/login' unless current_user
    end

end
