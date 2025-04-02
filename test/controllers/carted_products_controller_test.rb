require "test_helper"

class CartedProductsControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    assert_difference "CartedProduct.count", 1 do
      post "/cartedproduct.json", params: { user_id: , product_id: 800, quantity: 2, order_id: }
      assert_response 200
    end
  end
end
