class Product < ActiveRecord::Base
  has_many :order_items
  belongs_to :product_type

  validates :name, :price, :product_type_id, presence: true

  default_scope { order('name') }
end
