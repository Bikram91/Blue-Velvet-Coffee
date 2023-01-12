# == Schema Information
#
# Table name: cart_items
#
#  id           :bigint           not null, primary key
#  user_id      :bigint           not null
#  product_id   :bigint           not null
#  quantity     :integer          not null
#  product_name :string           not null
#  price        :float            not null
#  image_url    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class CartItem < ApplicationRecord
  validates :product_id, :user_id, :product_name, :price, :quantity, presence: true

  belongs_to :user,
  foreign_key: :user_id,
  class_name: :User


  belongs_to :product,
  foreign_key: :product_id,
  class_name: :Product
end
