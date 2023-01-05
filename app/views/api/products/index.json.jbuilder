@products.each do |product|
    json.set! product.name.split(' ').join('') do
        json.name product.name
    end
end