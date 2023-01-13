# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

  require 'open-uri'
# ApplicationRecord.transaction do
  puts "Destroying tables..."
  Review.destroy_all
  CartItem.destroy_all
  Product.destroy_all
  User.destroy_all

  puts "Resetting primary keys..."
  # For easy testing, so that after seeding, the first `User`, `Product`, `CartItem` has `id` of 1
  ApplicationRecord.connection.reset_pk_sequence!("users")
  ApplicationRecord.connection.reset_pk_sequence!("products")

  puts "Creating users..."
  # Create one user with an easy to remember username, email, and password:
  User.create!(
    username: "DemoUser",
    email: "demo@user.io",
    password: "password",
  )

  10.times do
    User.create!({
      username: Faker::Internet.unique.username(specifier: 3),
      email: Faker::Internet.unique.email,
      password: "password",
    })
  end

  puts "Creating products..."


  blend_1 = Product.create!({
      name: "Robusta Blend",
      product_type: "Blend",
      category: "COFFEE",
      description: "This blend stands to question everything the world believes about the robusta species. Through visionary coffee blending, meticulous and adaptive roasting, and explorative sourcing, we created a blend that redefines robusta. Smokey and delightfully bitter, robusta anchors this blend against bright, fruity Ethiopian arabica, and creates texture amidst the smooth sweetness of Latin American arabica.
      ",
      product_size: "HALF BAG(6OZ)",
      price: 16,
    })
  
    blend_1.photos.attach([
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/Robust/Robusta-Blend-No-1-M1-Hero.png"), filename: "blend11.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_1920,q_auto/Coffee/Robust/Robusta-Blend-No-1-M3-Design-Detail-Mobile.jpg"), filename: "blend12.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/Bella%20Donovan/Bella-Donovan-M4-Lifestyle-Desktop.jpg"), filename: "blend13.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_1920,q_auto/Coffee/Robust/Robusta-Blend-No-1-M3-Design-Detail-Mobile.jpg"), filename: "blend14.jpeg"}
    ])
    
    blend_2 = Product.create!({
      name: "Bella Donovan",
      product_type: "Blend",
      category: "COFFEE",
      description: "Whole Bean Coffee Blends
  
        Bella Donovan is the cashmere sweater of our blends—comforting, cozy, and enveloping. Made up of organic coffee beans, Bella punches above its weight. A natural Ethiopian coffee with jammy berry notes brings a glimmer of fruit to the otherwise chocolate-heavy foundation. To add nuance, we roast these two coffees four different ways. The result is a blend that straddles the worlds of complexity and comfort with uncommon poise.",
      product_size: "HALF BAG(6OZ)",
      price: 13,
    })

    blend_2.photos.attach([
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/Bella%20Donovan/Bella-Donovan-M1-Hero.png"), filename: "blend21.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/-Blends-M3-Design-Detail1.jpg"), filename: "blend22.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/Bella%20Donovan/Bella-Donovan-M4-Lifestyle-Desktop.jpg"), filename: "blend23.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/Bella%20Donovan/Bella-Donovan-Hover.jpg"), filename: "blend24.jpeg"}
    ])


  
    blend_3 = Product.create!({
      name: "Giant Steps",
      product_type: "Blend",
      category: "COFFEE",
      description: "Whole Bean Coffee Blends
  
      Giant Steps is a coffee whose chocolate notes ring constant from the first taste to the last. Straightforward and bold, this dark roast coffee wins you over with its uncomplicated comforting taste. There are no surprises here. No brightness or fruity fanfare. Just endless cocoa depth and sweet caramelization. Expect a finish that lingers pleasantly, like an aged whiskey.",
      product_size: "HALF BAG(6OZ)",
      price: 11,
    })


    blend_3.photos.attach([
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/Giant%20Steps/Giant-Steps-M1-Hero.png"), filename: "blend31.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/-Blends-M3-Design-Detail1.jpg"), filename: "blend32.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/Bella%20Donovan/Bella-Donovan-M4-Lifestyle-Desktop.jpg"), filename: "blend33.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/Giant%20Steps/Giant-Steps-Hover.jpg"), filename: "blend34.jpeg"}
    ])


    espresso_1 = Product.create!({
      name: "17th Ceiling",
      product_type: "Espresso",
      category: "COFFEE",
      description: "Whole Bean Espresso

      The trick to this sturdy, crema-heavy espresso is the inclusion of organic “fine” Robusta from India. This species of coffee has zero acidity and a ton of body, giving 17ft Ceiling its backbone. Next to Hayes Valley Espresso, which is like consuming a volume of In Search of Lost Time in liquid form, 17ft Ceiling is like flipping through The New Yorker—edifying without being overly taxing.",
      price: 14,
    })

    espresso_1.photos.attach([
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/17%20Ft%20Ceiling/17-Ft-Ceiling-M1-Hero.png"), filename: "espresso_11.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/17%20Ft%20Ceiling/17-Ft-Ceiling-M3-Design-Detail1-Desktop.jpg"), filename: "espresso12.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/Hayes%20Valley%20Espresso%202/Hayes-Valley-Espresso-M4-Lifestyle-Desktop.jpg"), filename: "espress13.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/17%20Ft%20Ceiling/17-Ft-Ceiling-Hover.jpg"), filename: "espresso_14.jpeg"}
    ])


    espresso_2 = Product.create!({
      name: "Opascope",
      product_type: "Espresso",
      category: "COFFEE",
      description: "Whole Bean Espresso

      We’re fond of the opascope—a quaint tool for projecting handwriting and artwork onto larger surfaces—as it conjures the nostalgia of our childhood classrooms. We see it as a tool to amplify careful craftsmanship for everyone to experience and enjoy, just like our Opascope Espresso. Refreshing against a lineup of dense, chocolatey selections, it yields an effervescent shot striped with tropicalia.",
      price: 13,
    })


    espresso_2.photos.attach([
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/Opascope%20Espresso/Opascope-Espresso-M1-Hero.png"), filename: "espresso_21.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/Opascope%20Espresso/Opascope-Espresso-M3-Design-Detail1-Desktop.jpg"), filename: "espresso22.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/Hayes%20Valley%20Espresso%202/Hayes-Valley-Espresso-M4-Lifestyle-Desktop.jpg"), filename: "espress23.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/Opascope%20Espresso/Opascope-Espresso-Hover-M2.jpg"), filename: "espresso_24.jpeg"}
    ])


    espresso_3 = Product.create!({
      name: "Dandy Espresso",
      product_type: "Espresso",
      category: "COFFEE",
      description: "Whole Bean Espresso

      Alluded to by the name, this balanced espresso makes you feel like everyone around you might break out into a musical number and you may actually join them. With wisps of citrus brightness held against a sweet backdrop of toffee and brown sugar, this espresso is not too dark, not too bright—just dandy. Get ready to walk with a jaunt in your step and a show tune in your head all day.",
      price: 15,
    })


    espresso_3.photos.attach([
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/_Blends-PLP.png"), filename: "espresso_31.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/Dandy%20Espresso/Dandy-Espresso-M2-Desktop.jpg"), filename: "espresso32.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/Brazil%20Chapada%20Diamantina%20Cha%CC%81cara%20Vista%20Alegre/Brazil-Chapada-Diamantina-Chacara-Vista-Alegre-M4-Lifestyle-Desktop.jpg"), filename: "espress33.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/Dandy%20Espresso/Dandy-Espresso-Hover.jpg"), filename: "espresso_34.jpeg"}
    ])
  
    cold_brew_1 = Product.create!({
      name: "Three Africas",
      product_type: "Cold Brew",
      category: "COFFEE",
      description: "Whole Bean Coffee Blends
  
      We often call this trio of African coffees the single origin lover’s blend. Yet the appeal of Three Africas spans more than any one kind of coffee. Sparkling yet grounded, Three Africas is roasted dark enough to be rounded and full, yet light enough to let flecks of berries and citrus shine. It’s a coffee that gives more than what the drinker is asking for: fruit, nuance, radiance, and a deep sweetness that wins over just about everyone.",
      product_size: "HALF BAG(6OZ)",
      price: 13,
    })

    cold_brew_1.photos.attach([
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/Three%20Africas/Three-Africas-M1-Hero.png"), filename: "cold_brew_11.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/-Blends-M3-Design-Detail1.jpg"), filename: "cold_brew_12.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Hario%20Cold%20Brew%20Bottle%20(Blue)/Hario-Cold-Brew-Bottle-Blue-M4-Lifestyle-Desktop.jpg"), filename: "cold_brew_13.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/Three%20Africas/Three-Africas-Hover-M2.jpg"), filename: "cold_brew_14.jpeg"}
    ])


    cold_brew_2 = Product.create!({
      name: "New Orleans-Style",
      product_type: "Cold Brew",
      category: "COFFEE",
      description: "Whole Bean Coffee Blend - Cold Brew

      Known affectionately as our NOLA, our New Orleans–Style Iced Coffee is one of our most popular drinks year-round. Casting around for a worthy iced-latte alternative, he stumbled upon the New Orleans tradition of serving sweet, milky coffee cut with chicory. To make our NOLA at home, we provide our whole-bean New Orleans–Style Coffee Blend and Ground Chicory, and a recipe to get you started. You just add the milk, sugar, ice, and a little bit of time.",
      product_size: "HALF BAG(6OZ)",
      price: 21,
    })


    cold_brew_2.photos.attach([
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/New%20Orleans-Style%20Coffee%20and%20Chicory/New-Orleans-Style-M1-Hero.png"), filename: "cold_brew_21.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/-Blends-M3-Design-Detail1.jpg"), filename: "cold_brew_22.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/Brazil%20Chapada%20Diamantina%20Cha%CC%81cara%20Vista%20Alegre/Brazil-Chapada-Diamantina-Chacara-Vista-Alegre-M4-Lifestyle-Desktop.jpg"), filename: "cold_brew_23.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/New%20Orleans-Style%20Coffee%20and%20Chicory/New-Orleans-Style-Hover-M2.jpg"), filename: "cold_brew_24.jpeg"}
    ])


    cold_brew_3 = Product.create!({
      name: "Decaf New Orleans-Style",
      product_type: "Cold Brew",
      category: "COFFEE",
      description: "Whole Bean Coffee Blend - Cold Brew


      For a cafe-quality NOLA, we offer whole beans so you can grind them for the freshest results. We recommend using the Toddy Cold Brew System to brew the coffee concentrate, but you can also make a very good New Orleans–Style Iced Coffee with a large pot and fine-mesh sieve.Each 12-oz bag makes enough coffee to make 8 New Orleans-Style Iced Coffees.",
      product_size: "HALF BAG(6OZ)",
      price: 21,
    })


    cold_brew_3.photos.attach([
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/New%20Orleans-Style%20Coffee%20and%20Chicory/New-Orleans-Style-M1-Hero.png"), filename: "cold_brew_31.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/-Blends-M3-Design-Detail1.jpg"), filename: "cold_brew_32.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/Decaf%20New%20Orleans/Decaf-New-Orleans-Style-M4-Lifestyle-Mobile.jpg"), filename: "cold_brew_33.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/New%20Orleans-Style%20Coffee%20and%20Chicory/Decaf-New-Orleans-Style-Hover-M2.jpg"), filename: "cold_brew_34.jpeg"}
    ])

    ceramic_1 = Product.create!({
      name: "Blue Bottle Mug",
      product_type: "Cermics",
      category: "Drinkware",
      description: "You know that mug you reach for most? Perfect handle. Holds the ideal amount of coffee. Looks at home on your kitchen counter, your desk, with both hands curled around it for morning warmth.

      For us, this is that mug. Simple. Sophisticated. Smooth porcelain, soft curves. Designed by our partners at Claska, in Japan. We call this long-standing staple, inspired by our Tokyo cafes, simply “Blue Bottle Mug.” Because, well, it feels like home.",
      product_size: "",
      price: 27,
    })

    ceramic_1.photos.attach([
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Blue%20Bottle%20Claska%20Mug/Blue-Bottle-Claska-Mug-M1-Hero.png"), filename: "drinkware_11.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Blue%20Bottle%20Claska%20Mug/Blue-Bottle-Claska-Mug-M3-Design-Detail1.jpg"), filename: "drinkware_12.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Blue%20Bottle%20Claska%20Mug/Blue-Bottle-Claska-Mug-M4-Lifestyle-Desktop.jpg"), filename: "drinkware_13.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Blue%20Bottle%20Claska%20Mug/Blue-Bottle-Claska-Mug-Hover-M2.jpg"), filename: "drinkware_14.jpeg"}
    ])


    ceramic_2 = Product.create!({
      name: "Hasami Stackable Latte Cups",
      product_type: "Cermics",
      category: "Drinkware",
      description: "Our new latte cup set, from Japan-based designers Hasami Porcelain, is made for sharing lattes as beautiful and sophisticated as the conversations you enjoy while sipping them. As a stackable set of two, these simple and timeless porcelain cups will be the vessel you reach for every morning for you and your partner.

      Fitting perfectly in the cradle of your palm at just over 6 oz, these cups are cozy as can be, great for a long pour of steamed milk over rich espresso.",
      product_size: "",
      price: 36,
    })


    ceramic_2.photos.attach([
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Holiday%202022%20Collection/Merch%20/Hasami%20Stackable%20/Hasami-Stackable-Cup-Set-M1-Detail2.jpg"), filename: "drinkware_21.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Holiday%202022%20Collection/Merch%20/Hasami%20Stackable%20/Hasami-Stackable-Cup-Set-M3-Design-Detail-Desktop.jpg"), filename: "drinkware_22.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Holiday%202022%20Collection/Merch%20/Hasami%20Stackable%20/Hasami-Stackable-Cup-Set-M4-Lifestyle-Desktop.jpg"), filename: "drinkware_23.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Holiday%202022%20Collection/Merch%20/Hasami%20Stackable%20/Hasami-Stackable-Cup-Set-M3-Design-Detail-Mobile.jpg"), filename: "drinkware_24.jpeg"}
    ])


    ceramic_3 = Product.create!({
      name: "Hasami Natural Mug with Saucer",
      product_type: "Cermics",
      category: "Drinkware",
      description: "We’ve long admired Hasami Porcelain, founded by Los Angeles–based designer Takuhiro Shinomoto, and the way the ceramicist elevates everyday functional objects.
      The studio is named in honor of the town of Hasami in the Nagasaki Prefecture of Japan, where traditional ceramics have been crafted since the Edo period four hundred years ago.
      
      
      In this grainy-textured mug, porcelain and clay come together with a matte finish to create a stackable mug that begs to be touched. The saucer doubles as a lid, which you can use to keep your coffee warm. Holds 13 oz. Microwave- and dishwasher-safe, made in Japan.",
      product_size: "",
      price: 40,
    })


    ceramic_3.photos.attach([
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Hasami%20Natural%20Mug%20with%20Saucer/Hasami-Natural-Mug-with-Saucer-M1-Component-Detail.png"), filename: "drinkware_31.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Hasami%20Natural%20Mug%20with%20Saucer/Hasami-Natural-Mug-with-Saucer-M3-Design-Detail1.jpg"), filename: "drinkware_32.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Hasami%20Natural%20Mug%20with%20Saucer/Hasami-Natural-Mug-with-Saucer-M4-Lifestyle-Desktop.jpg"), filename: "drinkware_33.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Hasami%20Natural%20Mug%20with%20Saucer/Hasami-Natural-Mug-with-Saucer-Hover.jpg"), filename: "drinkware_34.jpeg"}
    ])

    ceramic_4 = Product.create!({
      name: "Blue Bottle Latte Cup",
      product_type: "Cermics",
      category: "Drinkware",
      description: "We’ve long loved Japanese ceramic company Kinto’s Topo line for its playful asymmetry. So we collaborated with Kinto designer Shin Azumi to create these unique ceramics for our Japan cafes. Soon after, we realized the world needed to see them.

      Designed perfectly to uplift the creamy steamed milk of your latte, this 10 ounce cup is paired with an asymmetrical saucer, making it easy to hold with one hand as you sip away. Now you can enjoy your latte in your comfiest chair at home, even stateside.",
      product_size: "",
      price: 35,
    })


    ceramic_4.photos.attach([
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Blue%20Bottle%20Latte%20Cup%20and%20Saucer/Blue-Bottle-Latte-Cup-and-Saucer-M1-Hero.png"), filename: "drinkware_41.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Blue%20Bottle%20Latte%20Cup%20and%20Saucer/Blue-Bottle-Latte-Cup-and-Saucer-M3-Design-Detail1-Desktop.jpg"), filename: "drinkware_42.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Blue%20Bottle%20Latte%20Cup%20and%20Saucer/Blue-Bottle-Latte-Cup-and-Saucer-M4.jpg-Lifestyle-Desktop.jpg"), filename: "drinkware_43.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Blue%20Bottle%20Latte%20Cup%20and%20Saucer/Blue-Bottle-Latte-Cup-and-Saucer-Hover.jpg"), filename: "drinkware_44.jpeg"}
    ])



    ceramic_5 = Product.create!({
      name: "Winter Blooms Mug",
      product_type: "Ceramics",
      category: "Drinkware",
      description: "This oversized porcelain mug is inspired by winter’s quiet beauty and the colors of the exquisite arrangements of Sayaka Wada, longtime floral artist for Blue Bottle’s Northern California cafes.

      Its large capacity (14 oz) holds just the right amount for your morning pour over. Also, a delightful vessel for evening herbal tea.
      
      Like great coffee, Sayaka’s floral arrangements stop time, a sentiment echoed in the abstract art on this mug. Ideal for fueling winter daydreams.",
      product_size: "",
      price: 30,
    })


    ceramic_5.photos.attach([
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Winter%20Blooms%20Mug/Winter-Blooms-Mug-M1-Hero.png"), filename: "drinkware_51.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Winter%20Blooms%20Mug/Winter-Blooms-Mug-M3-Design-Detail1-Desktop.jpg"), filename: "drinkware_52.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/blue-bottle-coffee-ceramics-and-mugs_rshjp1.jpg"), filename: "drinkware_53.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Winter%20Blooms%20Mug/Winter-Blooms-Mug-Hover.jpg"), filename: "drinkware_54.jpeg"}
    ])


    travel_1 = Product.create!({
      name: "MiiR Commuter Cup",
      product_type: "Travel Mug",
      category: "Drinkware",
      description: "Calling all slow sippers: this staff favorite is a lifesaver in or out of the home. Insulated to keep hot coffee hot and cold drinks refreshing.

      Now with a straw in classic blue—perfect for taking your cold brew wherever your day brings you. We’ve also included a traditional no-straw lid, for hot coffee on chilly mornings. Ready for adventures anywhere future you feels called.",
      product_size: "",
      price: 34,
    })


    travel_1.photos.attach([
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/MiiR%2012-Oz%20Commuter%20Cup%20with%20Straw/MiiR-12-oz-Commuter-Cup-with-Straw-M1-Component-Detail.png"), filename: "drinkware_61.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/MiiR%2012-Oz%20Commuter%20Cup%20with%20Straw/MiiR-12-oz-Commuter-Cup-with-Straw-M3-Design-Detail1.jpg"), filename: "drinkware_62.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/MiiR%2012-Oz%20Commuter%20Cup%20with%20Straw/MiiR-12-oz-Commuter-Cup-with-Straw-M4-Lifestyle-Desktop.jpg"), filename: "drinkware_63.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/MiiR%2012-Oz%20Commuter%20Cup%20(no%20straw,%20different%20lid)/MiiR-12-oz-Commuter-Cup-No-Straw-Hover-M2.jpg"), filename: "drinkware_64.jpeg"}
    ])




    travel_2 = Product.create!({
      name: "MiiR 12-Oz Travel Mug",
      product_type: "Travel Mug",
      category: "Drinkware",
      description: "Perfect-sized travel mug. Comfy handle.

      Insulated walls keep liquids hot, even on wintry days—and NOLAs refreshingly cool in summer. Clear, spill-resistant lid lets you see how much you’ve got left to savor.
      
      Use for daily coffee at home without those last few sips getting cold. Add to your camping kit for chilly fireside mornings. Tote it on weekend getaways. Hand wash only.",
      product_size: "",
      price: 28,
    })


   travel_2.photos.attach([
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/MiiR%2012-Oz%20Travel%20Mug%20(Blue)/MiiR-12-oz-Travel-Mug-Blue-M1-Component-Detail.png"), filename: "drinkware_71.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/MiiR%2012-Oz%20Travel%20Mug%20(Blue)/MiiR-12-oz-Travel-Mug-Blue-M3-Design-Detail1.jpg"), filename: "drinkware_72.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Fellow%2016-Oz%20Carter%20Move%20Mug/Fellow-16-Ounce-Carter-Move-Mug-White-M4-Lifestyle-Desktop.jpg"), filename: "drinkware_73.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/MiiR%2012-Oz%20Travel%20Mug%20(Blue)/MiiR-12-oz-Travel-Mug-White-Hover-M2.jpg"), filename: "drinkware_74.jpeg"}
    ])




    travel_3 = Product.create!({
      name: "Go Bottle",
      product_type: "Travel Mug",
      category: "Drinkware",
      description: "Introducing our first water bottle, a collaboration with Revomax. Holds 16 ounces of your favorite beverage. Designed to keep cold drinks cold for 36 hours, hot drinks hot for 18 hours, and even carbonated drinks fizzy.

      Our favorite bit: say bye to too-tight or too-loose twist lids. Easily open and close the Go Bottle lid with one hand. Just press and lift. Leak-proof, guaranteed.",
      product_size: "",
      price: 40,
    })


    travel_3.photos.attach([
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Go%20Bottle/Go-Bottle-M1-Component-Detail.png"), filename: "travel_31.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Go%20Bottle/Go-Bottle-M3-Design-Detail1.jpg"), filename: "travel_32.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Go%20Bottle/Go-Bottle-M4-Lifestyle-Desktop.jpg"), filename: "travel_33.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Go%20Bottle/Go-Bottle-Hover-M2.jpg"), filename: "travel_34.jpeg"}
    ])



    glassware_1 = Product.create!({
      name: "Cafe Cup & Cookie Plate",
      product_type: "Glassware",
      category: "Drinkware",
      description: "Once again, we teamed up with our favorite drinkware craftspeople at Kinto in Japan to add a little extra room in your morning coffee routine for a delightful treat. Our luminous Kinto Cafe Cup is now paired with a maple wood saucer giving you enough room for your favorite coffee-accompanying cookie. Plus, the wide-mouthed cup is perfect for dunking. Yes, we thought of everything.

      A morning coffee and biscotti or an afternoon tea and shortbread—either way, it’s always good to make space for joy in your life.",
      product_size: "",
      price: 33,
    })


    glassware_1.photos.attach([
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Blue%20Bottle%20Coffee%20x%20Kinto:%20Cafe%20Cup%20and%20Cookie%20Plate/BBCxKinto-Cafe-Cup-and-Cookie-Plate-M1-Hero.png"), filename: "glassware_11.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Blue%20Bottle%20Coffee%20x%20Kinto:%20Cafe%20Cup%20and%20Cookie%20Plate/BBCxKinto-Cafe-Cup-and-Cookie-Plate-M3-Design-Detail1-Desktop.jpg"), filename: "glassware_12.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Blue%20Bottle%20Coffee%20x%20Kinto:%20Cafe%20Cup%20and%20Cookie%20Plate/BBCxKinto-Cafe-Cup-and-Cookie-Plate-M4-Lifestyle-Desktop.jpg"), filename: "glassware_13.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Blue%20Bottle%20Coffee%20x%20Kinto:%20Cafe%20Cup%20and%20Cookie%20Plate/BBCxKinto-Cafe-Cup-and-Cookie-Plate-Hover-M2.jpg"), filename: "glassware_14.jpeg"}
    ])


    glassware_2 = Product.create!({
      name: "Walled Glass Set",
      product_type: "Glassware",
      category: "Drinkware",
      description: "Round out your minimalist drinkware collection with this set of two elegant glasses. Double-walled insulation means you can sip as slowly as you like while your coffee stays at just the right temperature, whether you’re drinking an icy cold brew or piping-hot pour over.

      Plus, no condensation equals no puddles on your table. The soft curves of these glasses look lovely, and feel nice to hold, too. From longtime Blue Bottle partner Kinto.",
      product_size: "",
      price: 34,
    })

    glassware_2.photos.attach([
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Kinto%20Kronos%20Glass/Kinto-Kronos-Glass-M1-Hero.png"), filename: "glassware_21.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Kinto%20Kronos%20Glass/Kinto-Kronos-Glass-M3-Design-Detail1-Desktop.jpg"), filename: "glassware_22.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Kinto%20Kronos%20Glass/Kinto-Kronos-Glass-M4-Lifestyle-Desktop.jpg"), filename: "glassware_23.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Kinto%20Kronos%20Glass/Kinto-Kronos-Glass-Hover.jpg"), filename: "glassware_24.jpeg"}
    ])

    
    glassware_3 = Product.create!({
      name: "Cafe Cup & Saucer",
      product_type: "Glassware",
      category: "Drinkware",
      description: "Hold a glass cup of coffee and you can see its color variations and luminosity. That’s why we serve pour overs in our cafes in these elegant Kinto mugs, made exclusively for Blue Bottle.

      And although some measure their lives in coffee spoons, we think the better metric is cups of coffee shared with friends. That’s why we’ve bundled this set: two of our classic cafe mugs with two custom warm maple wood saucers, both by Kinto in Japan.
      
      Invite some Blue Bottle charm to your at-home coffee dates with this cup and saucer duo.",
      product_size: "",
      price: 46,
    })


    glassware_3.photos.attach([
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Blue%20Bottle%20Coffee%20x%20Kinto%20-%20Cafe%20Cup%20+%20Saucer%20for%20Two/BBCxKinto-Cafe-Cup-Saucer-M1-Hero.png"), filename: "glassware_31.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Blue%20Bottle%20Coffee%20x%20Kinto%20-%20Cafe%20Cup%20+%20Saucer%20for%20Two/BBCxKinto-Cafe-Cup-Saucer-M3-Design-Detail1.jpg"), filename: "glassware_32.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Blue%20Bottle%20Coffee%20x%20Kinto%20-%20Cafe%20Cup%20+%20Saucer%20for%20Two/BBCxKinto-Cafe-Cup-Saucer-M4-Lifestyle-Desktop.jpg"), filename: "glassware_33.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Merch%20PDPs/Blue%20Bottle%20Coffee%20x%20Kinto%20-%20Cafe%20Cup%20+%20Saucer%20for%20Two/BBCxKinto-Cafe-Cup-Saucer-Hover-M2.jpg"), filename: "glassware_34.jpeg"}
    ])



    # instant_3 = Product.create!({
    #   name: "Craft Instant Espresso and Cupping Spoon Set",
    #   product_type: "Espresso",
    #   category: "COFFEE",
    #   description: "A holiday gift set guaranteed to delight the coffee connoisseurs on your list: a 48 gram jar of Craft Instant Espresso for making consistently delicious lattes in seconds, plus our Blue Bottle Cupping Spoon, which doubles as both a perfectly-sized dose measurement and the ideal tasting tool.
  
    #   To bring more ease to the gifting season, this set comes wrapped and ready to spread warmth and deliciousness.",
    #   price: 14,
    # })
  
  
    # single_origin_1 = Product.create!({
    #   name: "Winter Single Origin",
    #   product_type: "Single Origin",
    #   category: "COFFEE",
    #   description: "Ethiopia Gedeb METAD Natural
  
    #   Every holiday season, we find ourselves craving this single origin. An unintentional annual feature, Ethiopia Gedeb METAD Natural calls to us when the holiday excitement is in full swing. With floral notes of honey and tart blueberry jam this naturally processed coffee boasts an overt fruitiness and complexity that dazzles and enlivens— the perfect accompaniment to all holiday gatherings.",
    #   product_size: "HALF BAG(6OZ)",
    #   price: 15,
    # })
  
  
    # single_origin_2 = Product.create!({
    #   name: "Guatemala El Injerto ET-47 Natural",
    #   product_type: "Single Origin",
    #   category: "COFFEE",
    #   description: "Producers dedicated to experimenting with specialty coffee may span across the world, but they run in tight circles. This coffee’s rare and elusive ET-47 seeds made their way from Ethiopia to Toño Barrantes, a Costa Rican coffee farmer, who then exchanged them with the Aguirres of El Injerto. From Ethiopia to Costa Rica to Guatemala to you, specialty coffee has a way of bringing us together.",
    #   product_size: "HALF BAG(6OZ)",
    #   price: 27,
    # })
  
  
    # single_origin_3 = Product.create!({
    #   name: "Colombia Mauricio Shattah Yellow Bourbon",
    #   product_type: "Single Origin",
    #   category: "COFFEE",
    #   description: "This coffee is as sweet as a schoolyard crush—fruity, delicate peach sweetness intermingles with thicker, richer caramel, while an aroma of fresh-cut roses ties it all together for a taste of pure, doe-eyed love. Shattah uses anaerobic fermentation combined with honey processing to create a subtle complexity that is responsible for the soft notes of stone fruit and overall balanced composition.",
    #   product_size: "HALF BAG(6OZ)",
    #   price: 31,
    # })
  
  
    # single_origin_3 = Product.create!({
    #   name: "Costa Rica La Lia Gesha Ethiopia Black Honey",
    #   product_type: "Single Origin",
    #   category: "COFFEE",
    #   description: "With every sip of this coffee there is something to explore and learn. The most striking trait is the intense floral aroma that comes from the Gesha and Ethiopian Heirloom cultivars. But complexity develops when the coffee cherry is pulped, leaving a thick layer of mucilage on the coffee bean.
  
    #   This technique, known as black honey processing, leaves the coffee with a deep, jammy sweetness balanced by soft citrus and green apple acidity that comes from the coffee’s time spent ferementing in airtight tanks.",
    #   product_size: "HALF BAG(6OZ)",
    #   price: 27,
    # })

  puts "Done!"
# end
