class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_that: 0 }
  validates :description, presence:true
  validates :description, length: { in: 1..500}

  def supplier
    Supplier.find_by(id: supplier_id)
  end

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
end
