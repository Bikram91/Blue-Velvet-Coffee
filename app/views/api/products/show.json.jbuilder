# json.set! @product.first.name.split(' ').join('') do
#     json.array! @product do |option|
#         json.extract! option, :id, :name, :product_size, :category, :product_type, :description, :price
#     end
# end

json.extract! @product, 
  :id, 
  :name, 
  :product_size, 
  :category, 
  :product_type,
  :description, 
  :price

if @product.photos.attached?
  json.imgUrls @product.photos.map{ |photo| photo.url }
else
  json.imgUrls ""
end
