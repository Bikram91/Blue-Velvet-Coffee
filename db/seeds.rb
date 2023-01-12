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

  


  # holiday_1 = Product.create!({
  #   name: "Winter Coffee Set",
  #   product_type: "HOLIDAY COFFEE SET",
  #   category: "COFFEE",
  #   description: "We brought our winter coffees together to give you the warmth and joy we love in this season. The Winter Blend is a cozy coffee that envelops you in sweet flavors of dark chocolate and molasses. While Ethiopia Gedeb METAD Natural sparkles with floral and fruity notes that uplift and enliven. Together, they embody the best facets of the season—the comfort of dormancy and the excitement of festivities.",
  #   price: 30,
  # })

  # holiday_1.photos.attach([
  #   {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Holiday%202022%20Collection/Coffee/Winter%20Coffee%20Sey/Winter-Coffee-Set-M1-Hero_1.png"), filename: "Winter1.jpeg"},
  #   {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Holiday%202022%20Collection/Coffee/Winter%20Coffee%20Sey/Winter-Coffee-Set-M3-Design-Detail1-Mobile.jpg"), filename: "Winter2.jpeg"},
  #   {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Holiday%202022%20Collection/Coffee/Winter%20Coffee%20Sey/Winter-Coffee-Set-M4-Lifestyle-Desktop.jpg"), filename: "Winter3.jpeg"},
  #   {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Holiday%202022%20Collection/Coffee/Winter%20Coffee%20Sey/Winter-Coffee-Set-M1-Hero_1.png"), filename: "Winter4.jpeg"}
  # ])

  # holiday_2 = Product.create!({
  #   name: "Winter Blend and Chocolate Pairing",
  #   product_type: "HOLIDAY COFFEE SET",
  #   category: "COFFEE",
  #   description: "Spoil the ones you love (including yourself) with this limited-edition holiday gift set. Our deeply fruited and comforting Winter Blend pairs beautifully with the caramelized orange and toffee notes of this 70% dark chocolate from Original Beans.Includes 6 oz of whole bean Winter Blend and a 12-pack of mini (12 g) Blue Bottle Coffee x Original Beans chocolates.",
  #   price: 35,
  # })

  # holiday_2.photos.attach([
  #   # {io: URI.open(""), filename: "Winter1.jpeg"},
  #   {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Holiday%202022%20Collection/Coffee/Winter%20Coffee%20Sey/Winter-Coffee-Set-M3-Design-Detail1-Mobile.jpg"), filename: "Winter2.jpeg"},
  #   {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Holiday%202022%20Collection/Coffee/Winter%20Coffee%20Sey/Winter-Coffee-Set-M4-Lifestyle-Desktop.jpg"), filename: "Winter3.jpeg"},
  #   {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Holiday%202022%20Collection/Coffee/Winter%20Coffee%20Sey/Winter-Coffee-Set-M1-Hero_1.png"), filename: "Winter4.jpeg"}
  # ])



  # holiday_3 = Product.create!({
  #   name: "Classic Blend Granola",
  #   product_type: "HOLIDAY COFFEE SET",
  #   category: "COFFEE",
  #   description: "We sought to refine a familiar comfort in this breakfast staple. Baked slowly with warm spices and both maple syrup and brown sugar, our Classic Blend Granola is rich without being heavy, and has that satisfying crunch you crave. To further draw out its flavor, pair our granola with one of our Organic coffee blends.

  #   Try it Blue Bottle cafe style with steamed milk, sprinkle it over yogurt, or eat it as a snack on its own—but always pair with a coffee on the side.
    
  #   Set contains one 12-ounce bag of whole-bean coffee and one 8-ounce bag granola.",
  #   price: 31,
  # })



  blend_1 = Product.create!({
      name: "Robusta Blend",
      product_type: "Blend",
      category: "COFFEE",
      description: "This blend stands to question everything the world believes about the robusta species. Through visionary coffee blending, meticulous and adaptive roasting, and explorative sourcing, we created a blend that redefines robusta. Smokey and delightfully bitter, robusta anchors this blend against bright, fruity Ethiopian arabica, and creates texture amidst the smooth sweetness of Latin American arabica.
      ",
      product_size: "HALF BAG(6OZ)",
      price: 14,
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
      price: 13,
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
      price: 13,
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
      price: 13,
    })


    espresso_3.photos.attach([
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/_Blends-PLP.png"), filename: "espresso_31.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/Dandy%20Espresso/Dandy-Espresso-M2-Desktop.jpg"), filename: "espresso32.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/Brazil%20Chapada%20Diamantina%20Cha%CC%81cara%20Vista%20Alegre/Brazil-Chapada-Diamantina-Chacara-Vista-Alegre-M4-Lifestyle-Desktop.jpg"), filename: "espress33.jpeg"},
      {io: URI.open("https://res.cloudinary.com/hbhhv9rz9/image/upload/f_auto,c_limit,w_3840,q_auto/Coffee/Dandy%20Espresso/Dandy-Espresso-Hover.jpg"), filename: "espresso_34.jpeg"}
    ])
  
    cold_brew_1 = Product.create!({
      name: "Three Africas",
      product_type: "Blend",
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










  
    # blend_6 = Product.create!({
    #   name: "Three Africas",
    #   product_type: "Blend",
    #   category: "COFFEE",
    #   description: "Whole Bean Coffee Blends
  
    #   Playlist is like the pair of adult siblings who, after years of talking over one another at the dinner table, finally get along. Two distinct washed coffees become mild and sweet, with flickers of brightness and whispers of fruit. How nice to know that this coffee blend, like family, finds balance when mixed in the right proportions.",
    #   product_size: "HALF BAG(6OZ)",
    #   price: 13,
    # })
  
    
    # espresso_1 = Product.create!({
    #   name: "Winter Espresso",
    #   product_type: "Espresso",
    #   category: "COFFEE",
    #   description: "Limited-edition espresso with notes of dark chocolate, dried raspberry, and salted toffee
  
    #   Our Winter Espresso is rich, complex, and velvety. It is pure luxury, and everyone deserves a moment of luxury this holiday season. A dark, brooding base is colored by bright wisps of tart fruit for a deep cup laced with nuance. This silky coffee makes for a rich experience as you linger over the at-home ritual of grinding beans, tamping grounds, pulling espresso, and savoring every last sip.",
    #   product_size: "HALF BAG(6OZ)",
    #   price: 14,
    # })
  
    # espresso_2 = Product.create!({
    #   name: "Hayes Valley Espresso",
    #   product_type: "Espresso",
    #   category: "COFFEE",
    #   description: "Whole Bean Espresso
  
    #   Our darkest espresso was developed for our first brick-and-mortar, a friend’s garage tucked away in San Francisco’s Hayes Valley. Today we serve Hayes Valley espresso in all of our cafes. Lower-toned and minimally bright, a straight shot has voluptuous tawny crema and formidable viscosity. Milk adds romance to Hayes’ brooding aspects, amplifying chocolate notes and adding a smooth, rounded touch.",
    #   product_size: "HALF BAG(6OZ)",
    #   price: 14,
    # })
  
    # espresso_3 = Product.create!({
    #   name: "17ft Ceiling",
    #   product_type: "Espresso",
    #   category: "COFFEE",
    #   description: "Whole Bean Espresso
  
    #   The trick to this sturdy, crema-heavy espresso is the inclusion of organic “fine” Robusta from India. This species of coffee has zero acidity and a ton of body, giving 17ft Ceiling its backbone. Next to Hayes Valley Espresso, which is like consuming a volume of In Search of Lost Time in liquid form, 17ft Ceiling is like flipping through The New Yorker—edifying without being overly taxing.",
    #   product_size: "HALF BAG(6OZ)",
    #   price: 13,
    # })
  
  
    # espresso_4 = Product.create!({
    #   name: "Opascope",
    #   product_type: "Espresso",
    #   category: "COFFEE",
    #   description: "Whole Bean Espresso
  
    #   We’re fond of the opascope—a quaint tool for projecting handwriting and artwork onto larger surfaces—as it conjures the nostalgia of our childhood classrooms. We see it as a tool to amplify careful craftsmanship for everyone to experience and enjoy, just like our Opascope Espresso. Refreshing against a lineup of dense, chocolatey selections, it yields an effervescent shot striped with tropicalia.",
    #   product_size: "HALF BAG(6OZ)",
    #   price: 13.50,
    # })
  
  
    # espresso_5 = Product.create!({
    #   name: "Espresso Set",
    #   product_type: "Espresso",
    #   category: "COFFEE",
    #   description: "We love espresso for its versatility. Everyone drinks it—the blue collar Italian (ciao, Robusta!) refueling between shifts to the connoisseur leisurely delighting in the layers of flavor. Like all good things in life, espresso is a fleeting moment of revelry.
  
    #   While you can use any coffee to make espresso, we created these three blends specifically for this potent brew method. Taste the possibilities of espresso with this set, from brooding to boisterous.
      
    #   Three 6oz bags of whole-bean coffee",
    #   price: 40,
    # })
  
  
    # espresso_6 = Product.create!({
    #   name: "Dandy Espresso",
    #   product_type: "Espresso",
    #   category: "COFFEE",
    #   description: "Whole Bean Espresso
  
    #   Alluded to by the name, this balanced espresso makes you feel like everyone around you might break out into a musical number and you may actually join them. With wisps of citrus brightness held against a sweet backdrop of toffee and brown sugar, this espresso is not too dark, not too bright—just dandy. Get ready to walk with a jaunt in your step and a show tune in your head all day.",
    #   product_size: "HALF BAG(6OZ)",
    #   price: 13.50,
    # })
  
  
    # instant_1 = Product.create!({
    #   name: "Craft Instant Espresso Multiserve",
    #   product_type: "Espresso",
    #   category: "COFFEE",
    #   description: "Make heavenly iced or hot lattes in seconds, anywhere life leads you. At home, your in-laws, an Airbnb getaway—whenever you crave a Blue Bottle cafe-quality espresso drink. Our custom process transforms exceptional craft coffee into aromatic crystals with the dimension and richness of espresso. Consistently delicious lattes couldn’t be simpler to brew. Jar includes 12 servings.",
    #   price: 25,
    # })
  
  
    # instant_2 = Product.create!({
    #   name: "Craft Instant Espresso Single Serve",
    #   product_type: "Espresso",
    #   category: "COFFEE",
    #   description: "Make heavenly iced or hot lattes in seconds, anywhere life leads you. At home, your in-laws’, an Airbnb getaway—whenever you crave a Blue Bottle cafe-quality espresso drink. Our custom process transforms exceptional craft coffee into aromatic crystals with the dimension and richness of espresso. Consistently delicious lattes couldn’t be simpler to brew.
  
    #   Includes five individual sachets.",
    #   price: 13,
    # })
  
  
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

    drinkware_1 = Product.create!({
      name: "Blue Bottle Mug",
      product_type: "Cermics",
      category: "Drinkware",
      description: "You know that mug you reach for most? Perfect handle. Holds the ideal amount of coffee. Looks at home on your kitchen counter, your desk, with both hands curled around it for morning warmth.

      For us, this is that mug. Simple. Sophisticated. Smooth porcelain, soft curves. Designed by our partners at Claska, in Japan. We call this long-standing staple, inspired by our Tokyo cafes, simply “Blue Bottle Mug.” Because, well, it feels like home.",
      product_size: "",
      price: 27,
    })


    drinkware_2 = Product.create!({
      name: "Hasami Stackable Latte Cups",
      product_type: "Cermics",
      category: "Drinkware",
      description: "Our new latte cup set, from Japan-based designers Hasami Porcelain, is made for sharing lattes as beautiful and sophisticated as the conversations you enjoy while sipping them. As a stackable set of two, these simple and timeless porcelain cups will be the vessel you reach for every morning for you and your partner.

      Fitting perfectly in the cradle of your palm at just over 6 oz, these cups are cozy as can be, great for a long pour of steamed milk over rich espresso.",
      product_size: "",
      price: 36,
    })


    drinkware_3 = Product.create!({
      name: "Kiyosumi Grey Mug",
      product_type: "Cermics",
      category: "Drinkware",
      description: "Our 14 ounce Kiyosumi Grey Mug was inspired by the calm of our Kiyosumi Shirakawa Cafe, in the heart of bustling Tokyo. The grey of the mug was pulled from the exterior of the cafe to bring the same sense of serenity you find there, regardless of the fast-paced city surrounding it.

      While this mug has a soothing, delicate look to it, its porcelain is sturdy enough to withstand the microwave and large enough to hold your morning pour overs, or evening herbal tea.",
      product_size: "",
      price: 35,
    })


    drinkware_4 = Product.create!({
      name: "Hasami Natural Mug with Saucer",
      product_type: "Cermics",
      category: "Drinkware",
      description: "We’ve long admired Hasami Porcelain, founded by Los Angeles–based designer Takuhiro Shinomoto, and the way the ceramicist elevates everyday functional objects.
      The studio is named in honor of the town of Hasami in the Nagasaki Prefecture of Japan, where traditional ceramics have been crafted since the Edo period four hundred years ago.
      
      
      In this grainy-textured mug, porcelain and clay come together with a matte finish to create a stackable mug that begs to be touched. The saucer doubles as a lid, which you can use to keep your coffee warm. Holds 13 oz. Microwave- and dishwasher-safe, made in Japan.",
      product_size: "",
      price: 40,
    })

    drinkware_5 = Product.create!({
      name: "Blue Bottle Latte Cup",
      product_type: "Cermics",
      category: "Drinkware",
      description: "We’ve long loved Japanese ceramic company Kinto’s Topo line for its playful asymmetry. So we collaborated with Kinto designer Shin Azumi to create these unique ceramics for our Japan cafes. Soon after, we realized the world needed to see them.

      Designed perfectly to uplift the creamy steamed milk of your latte, this 10 ounce cup is paired with an asymmetrical saucer, making it easy to hold with one hand as you sip away. Now you can enjoy your latte in your comfiest chair at home, even stateside.",
      product_size: "",
      price: 35,
    })



    drinkware_6 = Product.create!({
      name: "Winter Blooms Mug",
      product_type: "Ceramics",
      category: "Drinkware",
      description: "This oversized porcelain mug is inspired by winter’s quiet beauty and the colors of the exquisite arrangements of Sayaka Wada, longtime floral artist for Blue Bottle’s Northern California cafes.

      Its large capacity (14 oz) holds just the right amount for your morning pour over. Also, a delightful vessel for evening herbal tea.
      
      Like great coffee, Sayaka’s floral arrangements stop time, a sentiment echoed in the abstract art on this mug. Ideal for fueling winter daydreams.",
      product_size: "",
      price: 30,
    })


    drinkware_7 = Product.create!({
      name: "MiiR Commuter Cup",
      product_type: "Travel Mug",
      category: "Drinkware",
      description: "Calling all slow sippers: this staff favorite is a lifesaver in or out of the home. Insulated to keep hot coffee hot and cold drinks refreshing.

      Now with a straw in classic blue—perfect for taking your cold brew wherever your day brings you. We’ve also included a traditional no-straw lid, for hot coffee on chilly mornings. Ready for adventures anywhere future you feels called.",
      product_size: "",
      price: 34,
    })

    drinkware_8 = Product.create!({
      name: "MiiR 12Oz Travel Mug",
      product_type: "Travel Mug",
      category: "Drinkware",
      description: "Perfect-sized travel mug. Comfy handle.

      Insulated walls keep liquids hot, even on wintry days—and NOLAs refreshingly cool in summer. Clear, spill-resistant lid lets you see how much you’ve got left to savor.
      
      Use for daily coffee at home without those last few sips getting cold. Add to your camping kit for chilly fireside mornings. Tote it on weekend getaways. Hand wash only.",
      product_size: "",
      price: 34,
    })

    drinkware_9 = Product.create!({
      name: "Go Bottle",
      product_type: "Travel Mug",
      category: "Drinkware",
      description: "Introducing our first water bottle, a collaboration with Revomax. Holds 16 ounces of your favorite beverage. Designed to keep cold drinks cold for 36 hours, hot drinks hot for 18 hours, and even carbonated drinks fizzy.

      Our favorite bit: say bye to too-tight or too-loose twist lids. Easily open and close the Go Bottle lid with one hand. Just press and lift. Leak-proof, guaranteed.",
      product_size: "",
      price: 40,
    })



    drinkware_10 = Product.create!({
      name: "Cafe Cup & Cookie Plate",
      product_type: "Glassware",
      category: "Drinkware",
      description: "Once again, we teamed up with our favorite drinkware craftspeople at Kinto in Japan to add a little extra room in your morning coffee routine for a delightful treat. Our luminous Kinto Cafe Cup is now paired with a maple wood saucer giving you enough room for your favorite coffee-accompanying cookie. Plus, the wide-mouthed cup is perfect for dunking. Yes, we thought of everything.

      A morning coffee and biscotti or an afternoon tea and shortbread—either way, it’s always good to make space for joy in your life.",
      product_size: "",
      price: 33,
    })


    drinkware_11 = Product.create!({
      name: "Walled Glass Set",
      product_type: "Glassware",
      category: "Drinkware",
      description: "Round out your minimalist drinkware collection with this set of two elegant glasses. Double-walled insulation means you can sip as slowly as you like while your coffee stays at just the right temperature, whether you’re drinking an icy cold brew or piping-hot pour over.

      Plus, no condensation equals no puddles on your table. The soft curves of these glasses look lovely, and feel nice to hold, too. From longtime Blue Bottle partner Kinto.",
      product_size: "",
      price: 34,
    })

    
    drinkware_12 = Product.create!({
      name: "Cafe Cup & Saucer",
      product_type: "Glassware",
      category: "Drinkware",
      description: "Hold a glass cup of coffee and you can see its color variations and luminosity. That’s why we serve pour overs in our cafes in these elegant Kinto mugs, made exclusively for Blue Bottle.

      And although some measure their lives in coffee spoons, we think the better metric is cups of coffee shared with friends. That’s why we’ve bundled this set: two of our classic cafe mugs with two custom warm maple wood saucers, both by Kinto in Japan.
      
      Invite some Blue Bottle charm to your at-home coffee dates with this cup and saucer duo.",
      product_size: "",
      price: 46,
    })




















  









  puts "Done!"
# end
