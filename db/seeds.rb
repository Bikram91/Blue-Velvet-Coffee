# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do
  puts "Destroying tables..."

  User.destroy_all
  Product.destroy_all

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

  holiday_1 = Product.create!({
    name: "Winter Coffee Set",
    category: category_1,
    product_type: "COFFEE",
    description: "We brought our winter coffees together to give you the warmth and joy we love in this season. The Winter Blend is a cozy coffee that envelops you in sweet flavors of dark chocolate and molasses. While Ethiopia Gedeb METAD Natural sparkles with floral and fruity notes that uplift and enliven. Together, they embody the best facets of the season—the comfort of dormancy and the excitement of festivities.",
    price: 30,
  })

  holiday_2 = Product.create!({
    name: "Winter Blend and Chocolate Pairing",
    category: "HOLIDAY COFFEE SET",
    product_type: "COFFEE",
    description: "Spoil the ones you love (including yourself) with this limited-edition holiday gift set. Our deeply fruited and comforting Winter Blend pairs beautifully with the caramelized orange and toffee notes of this 70% dark chocolate from Original Beans.Includes 6 oz of whole bean Winter Blend and a 12-pack of mini (12 g) Blue Bottle Coffee x Original Beans chocolates.",
    price: 35,
  })

  holiday_3 = Product.create!({
    name: "Classic Blend Granola with Your Choice of a Blue Bottle Coffee Blend",
    category: "HOLIDAY COFFEE SET",
    product_type: "COFFEE",
    description: "We sought to refine a familiar comfort in this breakfast staple. Baked slowly with warm spices and both maple syrup and brown sugar, our Classic Blend Granola is rich without being heavy, and has that satisfying crunch you crave. To further draw out its flavor, pair our granola with one of our Organic coffee blends.

    Try it Blue Bottle cafe style with steamed milk, sprinkle it over yogurt, or eat it as a snack on its own—but always pair with a coffee on the side.
    
    Set contains one 12-ounce bag of whole-bean coffee and one 8-ounce bag granola.",
    price: 31,
  })

  blend_1 = Product.create!({
    name: "Winter Blend",
    category: "Blend",
    product_type: "COFFEE",
    description: "Deeply fruited, limited-edition blend with notes of dark chocolate and molasses

      Warm and full-bodied with a glimmer of brightness from an Ethiopian component, this blend is a beautiful embodiment of the season’s comfort. Rich notes of bittersweet chocolate and thick molasses are folded into layers of sweet and tart blackberry jam. For our Giant Steps and Bella Donovan lovers, this blend has a familiar flavor profile that’s tied up in a ribbon of fruity brightness.",
    product_size: "HALF BAG(6OZ)",
    price: 14,
  })
  
  blend_2 = Product.create!({
    name: "Bella Donovan",
    category: "Blend",
    product_type: "COFFEE",
    description: "Whole Bean Coffee Blends

      Bella Donovan is the cashmere sweater of our blends—comforting, cozy, and enveloping. Made up of organic coffee beans, Bella punches above its weight. A natural Ethiopian coffee with jammy berry notes brings a glimmer of fruit to the otherwise chocolate-heavy foundation. To add nuance, we roast these two coffees four different ways. The result is a blend that straddles the worlds of complexity and comfort with uncommon poise.",
    product_size: "HALF BAG(6OZ)",
    price: 13,
  })

  blend_3 = Product.create!({
    name: "Giant Steps",
    category: "Blend",
    product_type: "COFFEE",
    description: "Whole Bean Coffee Blends

    Giant Steps is a coffee whose chocolate notes ring constant from the first taste to the last. Straightforward and bold, this dark roast coffee wins you over with its uncomplicated comforting taste. There are no surprises here. No brightness or fruity fanfare. Just endless cocoa depth and sweet caramelization. Expect a finish that lingers pleasantly, like an aged whiskey.",
    product_size: "HALF BAG(6OZ)",
    price: 13,
  })

  blend_4 = Product.create!({
    name: "Blend Box",
    category: "Blend",
    product_type: "COFFEE",
    description: "Our blends are carefully chosen from two or three coffees for their harmonious relationship in the cup. Roasted with desired flavor profiles in mind, each blend combines varying regions, climates, and processing methods to arrive at something that’s as comforting as an old friend, but flushed with the excitement of first love.

    Try (or share) our most popular blends to find a flavor for every craving and a coffee for every mood. Freshly roasted and taste-tested daily by our passionate roasting team for consistent deliciousness.
    
    Three 6oz bags of whole-bean coffee",
    price: 40,
  })

  blend_5 = Product.create!({
    name: "Three Africas",
    category: "Blend",
    product_type: "COFFEE",
    description: "Whole Bean Coffee Blends

    We often call this trio of African coffees the single origin lover’s blend. Yet the appeal of Three Africas spans more than any one kind of coffee. Sparkling yet grounded, Three Africas is roasted dark enough to be rounded and full, yet light enough to let flecks of berries and citrus shine. It’s a coffee that gives more than what the drinker is asking for: fruit, nuance, radiance, and a deep sweetness that wins over just about everyone.",
    product_size: "HALF BAG(6OZ)",
    price: 13,
  })

  blend_6 = Product.create!({
    name: "Three Africas",
    category: "Blend",
    product_type: "COFFEE",
    description: "Whole Bean Coffee Blends

    Playlist is like the pair of adult siblings who, after years of talking over one another at the dinner table, finally get along. Two distinct washed coffees become mild and sweet, with flickers of brightness and whispers of fruit. How nice to know that this coffee blend, like family, finds balance when mixed in the right proportions.",
    product_size: "HALF BAG(6OZ)",
    price: 13,
  })

  blend_7 = Product.create!({
    name: "Beta Blend",
    category: "Blend",
    product_type: "COFFEE",
    description: "Whole Bean Coffee Blends

    While many of our coffee blends are noteworthy for their sturdiness, the glassy and floral Beta Blend is cut from a different cloth. a delicate counterpoint to our heftier blends—available for online purchase exclusively.",
    product_size: "HALF BAG(6OZ)",
    price: 13,
  })
  
  espresso_1 = Product.create!({
    name: "Winter Espresso",
    category: "Espresso",
    product_type: "COFFEE",
    description: "Limited-edition espresso with notes of dark chocolate, dried raspberry, and salted toffee

    Our Winter Espresso is rich, complex, and velvety. It is pure luxury, and everyone deserves a moment of luxury this holiday season. A dark, brooding base is colored by bright wisps of tart fruit for a deep cup laced with nuance. This silky coffee makes for a rich experience as you linger over the at-home ritual of grinding beans, tamping grounds, pulling espresso, and savoring every last sip.",
    product_size: "HALF BAG(6OZ)",
    price: 14,
  })

  espresso_2 = Product.create!({
    name: "Hayes Valley Espresso",
    category: "Espresso",
    product_type: "COFFEE",
    description: "Whole Bean Espresso

    Our darkest espresso was developed for our first brick-and-mortar, a friend’s garage tucked away in San Francisco’s Hayes Valley. Today we serve Hayes Valley espresso in all of our cafes. Lower-toned and minimally bright, a straight shot has voluptuous tawny crema and formidable viscosity. Milk adds romance to Hayes’ brooding aspects, amplifying chocolate notes and adding a smooth, rounded touch.",
    product_size: "HALF BAG(6OZ)",
    price: 14,
  })

  espresso_3 = Product.create!({
    name: "17ft Ceiling",
    category: "Espresso",
    product_type: "COFFEE",
    description: "Whole Bean Espresso

    The trick to this sturdy, crema-heavy espresso is the inclusion of organic “fine” Robusta from India. This species of coffee has zero acidity and a ton of body, giving 17ft Ceiling its backbone. Next to Hayes Valley Espresso, which is like consuming a volume of In Search of Lost Time in liquid form, 17ft Ceiling is like flipping through The New Yorker—edifying without being overly taxing.",
    product_size: "HALF BAG(6OZ)",
    price: 13,
  })


  espresso_4 = Product.create!({
    name: "Opascope",
    category: "Espresso",
    product_type: "COFFEE",
    description: "Whole Bean Espresso

    We’re fond of the opascope—a quaint tool for projecting handwriting and artwork onto larger surfaces—as it conjures the nostalgia of our childhood classrooms. We see it as a tool to amplify careful craftsmanship for everyone to experience and enjoy, just like our Opascope Espresso. Refreshing against a lineup of dense, chocolatey selections, it yields an effervescent shot striped with tropicalia.",
    product_size: "HALF BAG(6OZ)",
    price: 13.50,
  })


  espresso_5 = Product.create!({
    name: "Espresso Set",
    category: "Espresso",
    product_type: "COFFEE",
    description: "We love espresso for its versatility. Everyone drinks it—the blue collar Italian (ciao, Robusta!) refueling between shifts to the connoisseur leisurely delighting in the layers of flavor. Like all good things in life, espresso is a fleeting moment of revelry.

    While you can use any coffee to make espresso, we created these three blends specifically for this potent brew method. Taste the possibilities of espresso with this set, from brooding to boisterous.
    
    Three 6oz bags of whole-bean coffee",
    price: 40,
  })


  espresso_6 = Product.create!({
    name: "Dandy Espresso",
    category: "Espresso",
    product_type: "COFFEE",
    description: "Whole Bean Espresso

    Alluded to by the name, this balanced espresso makes you feel like everyone around you might break out into a musical number and you may actually join them. With wisps of citrus brightness held against a sweet backdrop of toffee and brown sugar, this espresso is not too dark, not too bright—just dandy. Get ready to walk with a jaunt in your step and a show tune in your head all day.",
    product_size: "HALF BAG(6OZ)",
    price: 13.50,
  })


  instant_1 = Product.create!({
    name: "Craft Instant Espresso Multiserve",
    category: "Espresso",
    product_type: "COFFEE",
    description: "Make heavenly iced or hot lattes in seconds, anywhere life leads you. At home, your in-laws, an Airbnb getaway—whenever you crave a Blue Bottle cafe-quality espresso drink. Our custom process transforms exceptional craft coffee into aromatic crystals with the dimension and richness of espresso. Consistently delicious lattes couldn’t be simpler to brew. Jar includes 12 servings.",
    price: 25,
  })


  instant_2 = Product.create!({
    name: "Craft Instant Espresso Single Serve",
    category: "Espresso",
    product_type: "COFFEE",
    description: "Make heavenly iced or hot lattes in seconds, anywhere life leads you. At home, your in-laws’, an Airbnb getaway—whenever you crave a Blue Bottle cafe-quality espresso drink. Our custom process transforms exceptional craft coffee into aromatic crystals with the dimension and richness of espresso. Consistently delicious lattes couldn’t be simpler to brew.

    Includes five individual sachets.",
    price: 13,
  })


  instant_3 = Product.create!({
    name: "Craft Instant Espresso and Cupping Spoon Set",
    category: "Espresso",
    product_type: "COFFEE",
    description: "A holiday gift set guaranteed to delight the coffee connoisseurs on your list: a 48 gram jar of Craft Instant Espresso for making consistently delicious lattes in seconds, plus our Blue Bottle Cupping Spoon, which doubles as both a perfectly-sized dose measurement and the ideal tasting tool.

    To bring more ease to the gifting season, this set comes wrapped and ready to spread warmth and deliciousness.",
    price: 14,
  })


  single_origin_1 = Product.create!({
    name: "Winter Single Origin",
    category: "Single Origin",
    product_type: "COFFEE",
    description: "Ethiopia Gedeb METAD Natural

    Every holiday season, we find ourselves craving this single origin. An unintentional annual feature, Ethiopia Gedeb METAD Natural calls to us when the holiday excitement is in full swing. With floral notes of honey and tart blueberry jam this naturally processed coffee boasts an overt fruitiness and complexity that dazzles and enlivens— the perfect accompaniment to all holiday gatherings.",
    product_size: "HALF BAG(6OZ)",
    price: 15,
  })


  single_origin_2 = Product.create!({
    name: "Guatemala El Injerto ET-47 Natural",
    category: "Single Origin",
    product_type: "COFFEE",
    description: "Producers dedicated to experimenting with specialty coffee may span across the world, but they run in tight circles. This coffee’s rare and elusive ET-47 seeds made their way from Ethiopia to Toño Barrantes, a Costa Rican coffee farmer, who then exchanged them with the Aguirres of El Injerto. From Ethiopia to Costa Rica to Guatemala to you, specialty coffee has a way of bringing us together.",
    product_size: "HALF BAG(6OZ)",
    price: 27,
  })


  single_origin_3 = Product.create!({
    name: "Colombia Mauricio Shattah Yellow Bourbon",
    category: "Single Origin",
    product_type: "COFFEE",
    description: "This coffee is as sweet as a schoolyard crush—fruity, delicate peach sweetness intermingles with thicker, richer caramel, while an aroma of fresh-cut roses ties it all together for a taste of pure, doe-eyed love. Shattah uses anaerobic fermentation combined with honey processing to create a subtle complexity that is responsible for the soft notes of stone fruit and overall balanced composition.",
    product_size: "HALF BAG(6OZ)",
    price: 31,
  })


  single_origin_3 = Product.create!({
    name: "Costa Rica La Lia Gesha Ethiopia Black Honey",
    category: "Single Origin",
    product_type: "COFFEE",
    description: "With every sip of this coffee there is something to explore and learn. The most striking trait is the intense floral aroma that comes from the Gesha and Ethiopian Heirloom cultivars. But complexity develops when the coffee cherry is pulped, leaving a thick layer of mucilage on the coffee bean.

    This technique, known as black honey processing, leaves the coffee with a deep, jammy sweetness balanced by soft citrus and green apple acidity that comes from the coffee’s time spent ferementing in airtight tanks.",
    product_size: "HALF BAG(6OZ)",
    price: 27,
  })
















  









  puts "Done!"
end
