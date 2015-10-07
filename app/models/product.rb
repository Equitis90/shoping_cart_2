class Product < ActiveRecord::Base
  has_many :order_items
  belongs_to :product_type

  default_scope { where(active: true) }
end
