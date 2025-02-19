class ProductsController < ApplicationController
  def one_product
    @product = Product.first
    render template: "products/show"
  end
  def all_products
    @product = Product.all
    render template: "products/index"
  end
end
