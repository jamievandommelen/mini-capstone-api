class CartedProductsController < ApplicationController
  def create
    if current_user.nil?
      # Handle case when user is not logged in, maybe redirect or show an error
      render json: { error: 'You must be logged in to add products to your cart' }, status: :unauthorized
      return
    end
    @carted_product = CartedProduct.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: 'carted',
      order_id: nil,
    )
    render :show
  end

  def index
    @carted_products = CartedProduct.all
    render :index
  end


  def destroy 
    @carted_product = CartedProduct.find_by(order_id: params[order_id])
    carted_products.update_all(status: 'removed')
    render json:{ message: 'order removed from cart'}
  end
end

