# == Schema Information
#
# Table name: products
#
#  id           :bigint           not null, primary key
#  name         :string           not null
#  category     :string           not null
#  product_type :string
#  description  :text             not null
#  price        :float            not null
#  product_size :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Product < ApplicationRecord
  validates :name, :category, :description, :price, presence: true

  has_many :cart_items,
           foreign_key: :product_id,
           class_name: :CartItem

  has_many :users,
           through: :carts

  has_many :reviews, 
  class_name: :Review, 
  foreign_key: :product_id

  has_many :products,
  through: :cart_items

  has_many_attached :photos
end
