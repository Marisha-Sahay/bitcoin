class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :authenticate_user!
  helper_method :human_date_and_time
  before_action :calculate_cart_count

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def human_date_and_time(date)
    date.strftime("%b %e, %l:%M %p")
  end

  def authenticate_user!
    redirect_to '/login' unless current_user
  end

  def authenticate_admin!
    if current_user && current_user.admin
        #do nothing
    else
      flash[:danger] = "Get out of here hacker!"
      redirect_to "/products"
    end
  end

  def calculate_cart_count
    # if current_user && current_user.orders.find_by(complete: false)
    #   if session[:cart_count]
    #     @cart_count = session[:cart_count]
    #   else
    #     @cart_count = 0
    #     current_user.orders.find_by(complete: false).carted_products.each do |carted_product|
    #       @cart_count += carted_product.quantity
    #     end
    #   end
    #   session[:cart_count] = @cart_count
    # else
    #   redirect_to "/products"
    # end
  end
  
end
