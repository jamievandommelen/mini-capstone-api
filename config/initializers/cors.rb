Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "mini-capstone.peterxjang.com" , "localhost:5173", "mini-capstone-frontend-oxml.onrender.com"
    resource "*", headers: :any, credentials: true, methods: [ :get, :post, :patch, :put, :delete ]
  end
end
