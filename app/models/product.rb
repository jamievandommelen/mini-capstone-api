class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_that: 0 }
  validates :description, presence:true
  validates :description, length: { in: 1..500}

  belongs_to :supplier
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  has_many :images
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :category_products
  has_many :categories, through: :category_products
  



  def is_discounted?
    if price <= 10
      return true
    else
      return false
    end
  end
  def tax
    price * 0.09
  end
  def total
    price + tax
  end

  def primary_image_url
    if images.length > 0
      images[0].url
    else
      "https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg"
    end
  end
end
