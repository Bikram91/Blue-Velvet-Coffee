# == Schema Information
#
# Table name: reviews
#
#  id            :bigint           not null, primary key
#  title         :string           not null
#  user_id       :bigint           not null
#  product_id    :bigint           not null
#  rating        :integer          not null
#  body          :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  reviewer_name :string           not null
#
class Review < ApplicationRecord
    validates :title, :rating, :reviewer_name, :body, presence: true

    belongs_to :user,
    class_name: :User,
    foreign_key: :user_id

    belongs_to :product, 
    class_name: :Product, 
    foreign_key: :product_id


    
end
