class OrdersController < ApplicationController
  before_action :authenticate_user
  
  
  def index 
    @orders = current_user.orders
    render :index
  end
  
  
  def show
    @order = Order.find_by(id: params[:id])
    render :show
  end
  
  def create
    carted_products = current_user.carted_products.where(status: 'carted')

    subtotal = 0
    carted_products.each do |carted_product|
      subtotal += carted_product.price * carted_product.quantity
    end

    tax = subtotal * 0.08
    total = subtotal + tax

    
    @order = Order.create(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    
    carted_products.update_all(status: 'purchased', order_id: order_id)
    
    render :show
  end
end

