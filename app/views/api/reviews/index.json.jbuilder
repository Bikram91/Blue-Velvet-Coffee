@reviews.each do |review|
    json.set! review.id do
      json.extract! review, :id, :user_id, :product_id, :reviewer_name, :title, :body, :rating, :created_at
  
        json.product_name  review.product.name
    end
  end