# @products.each do |product|
#     # json.set! product.name.split(' ').join('') do
#         json.set! product.id do
#         json.name product.name
#         json.category product.category
#         json.product_type product.product_type
#         json.description product.description
#         json.price product.price
#     end
# end
@products.each do |product|
  # json.set! product.category do
    json.set! product.id do
      json.extract! product,
        :id,
        :name,
        :category,
        :product_type,
        :description,
        :price

      if product.photos.attached?
        json.imgUrls product.photos.map { |photo| photo.url }
      else
        json.imgUrls ""
      end
    end
  # end
end
