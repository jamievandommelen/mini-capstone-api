class ProductsController < ApplicationController
  def one_product
    @product = Product.first
    render template: "contacts/show"
  end
end
