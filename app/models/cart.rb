# == Schema Information
#
# Table name: carts
#
#  id          :bigint           not null, primary key
#  customer_id :bigint           not null
#  product_id  :bigint           not null
#  quantity    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cart < ApplicationRecord
  validates :quantity, presence: true

  belongs_to :customer,
             foreign_key: :customer_id,
             class_name: :User

  belongs_to :product,
             class_name: :Product,
             foreign_key: :product_id
end
