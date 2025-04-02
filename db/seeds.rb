# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Supplier.create(name: "amazon", email: "amazon.com", phone_number: "7176554321")
Supplier.create(name: "Aerie", email: "aerie.com", phone_number: "4335678432")


Product.create(supplier_id: 1, name: "Aloe Plant", price: 10, description: "be so serious")
Product.create(supplier_id: 2, name: "Monstera Plant", price: 20, description: "pretty plant")
Product.create(supplier_id: 1, name: "Cattleya", price: 100, description: "a very pretty flower")
Product.create(supplier_id: 2, name: "Anthurium", price: 60, description: "a very pretty flower")
Product.create(supplier_id: 1, name: "Orchid", price: 150, description: "a very pretty flower")



Image.create(product_id: 1 , url: "https://hips.hearstapps.com/hmg-prod/images/aloe-vera-")
Image.create(product_id: 2, url: "https://gardenerspath.com/wp-content/uploads/2022/01/Types-of-Anthurium-FB.jpg")
Image.create(product_id: 3, url: "https://static1.backyardbossimages.com/wordpress/wp-content/uploads/2022/12/monstera-living-room.jpg
")
Image.create(product_id: 4, url: "https://images.squarespace-cdn.com/content/v1/56923fa6a976af0bfc533475/4487beac-be01-4ad5-8133-3276fb81972b/IMG_7938.jpg")
Image.create(product_id: 5, url: "https://images.prismic.io/orchidweb/8f2a9f8c-ea23-412a-9285-d7524d9f88b9_Phalaenopsis.jpeg?auto=compress,format")
Image.create(product_id: 6, url: "https://cdn.britannica.com/13/75913-004-954CDFA0/orchids.jpg
")

