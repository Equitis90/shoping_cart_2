class ProductType < ActiveRecord::Base
  has_many :products
  before_destroy :destroy_validation

  validates :title, presence: true

  def destroy_validation
    if Product.where( product_type_id: self.id ).first.nil?
      true
    else
      errors.add(:base, "Product type can't be deleted, products present")
      false
    end
  end
end
