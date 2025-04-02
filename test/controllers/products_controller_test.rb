require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(name: "Test", email: "test@test.com", password: "password", admin: true)
    post "/sessions.json", params: { email: "test@test.com", password: "password" }
  end
  
  
  
  
  
  
  
  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json", params: { name: "test", price: 10, image_url: "test.jpg", description: "test description", supplier_id: Supplier.first.id }
      assert_response 200
    end

    assert_difference "Product.count", 0 do
      post "/products.json", params: {}
      assert_response 422
    end
    cookies.delete("user_id")
    post "/products.json"
    assert_response 401
  end

  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal [ "id", "name", "price", "image_url", "description", "is_discounted?","tax", "supplier", "total", "created_at", "updated_at" ], data.keys
  end

  test "update" do
    product = Product.first
    patch "/products/#{product.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
    assert_equal product.price, data["price"]
    assert_equal product.description, data["description"]

    patch "/products/#{product.id}.json", params: { price: -2}
    assert_response 422
  
    cookies.delete("user_id")
    patch "/products/#{products.id}.json"
    assert_response 401
  end

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json"
      assert_response 200
    end
  
    cookies.delete("user.id")
    delete "/products/#{Product.first.id}.json"
    assert_response 401
  
  end
end
