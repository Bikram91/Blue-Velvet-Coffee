json.set! @product.first.name.split(' ').join('') do
    json.array! @product do |option|
        json.extract! option, :id, :name, :product_size :category, :product_type, :description, :price
    end
end