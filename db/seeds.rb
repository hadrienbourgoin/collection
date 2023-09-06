# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

User.destroy_all
nbr = 1
5.times do
  new_user = User.create!(email: "test#{nbr}@gmail.com",
                          password: "azerty",
                          password_confirmation: "azerty",
                          first_name: Faker::Name.first_name,
                          last_name: Faker::Name.last_name,
                          bio: "test",
                          username: "Ninja#{nbr}")
  new_user.photo.attach(io: URI.open("https://dessins-animes-hrd.appspot.com/img/dessins-animes/davidlegnome.jpg"), filename: "avatar", content_type: "image/jpg")
  print "#{5 - nbr} users left to create\n\n"
  nbr += 1
end

Compilation.destroy_all
figures = Compilation.create!(name: "Figures",
                              description: "My figures collection",
                              public: true,
                              user: User.first)
cards = Compilation.create!(name: "Cards",
                            description: "My cards collection",
                            public: true,
                            user: User.first)
cars = Compilation.create!(name: "Cars",
                           description: "My cars collection",
                           public: true,
                           user: User.first)
hats = Compilation.create!(name: "Hats",
                           description: "My Hats collection",
                           public: true,
                           user: User.first)
ps1 = Compilation.create!(name: "PS1",
                          description: "My PS1 collection",
                          public: true,
                          user: User.first)
rocks = Compilation.create!(name: "Rocks",
                            description: "My Rocks collection",
                            public: true,
                            user: User.first)
sneakers = Compilation.create!(name: "Sneakers",
                               description: "My sneakers collection",
                               public: true,
                               user: User.first)
stamps = Compilation.create!(name: "Stamps",
                             description: "My stamps collection",
                             public: true,
                             user: User.second)
plants = Compilation.create!(name: "Plants",
                             description: "My plants collection",
                             public: true,
                             user: User.last)
unicorns = Compilation.create!(name: "Unicorns",
                              description: "My unicorns collection",
                              public: true,
                              user: User.last)
paintings = Compilation.create!(name: "Paintings",
                                description: "My paintings collection",
                                public: true,
                                user: User.last)
lorcana = Compilation.create!(name: "Lorcana",
                              description: "My lorcana collection",
                              public: true,
                              user: User.last)
robinets = Compilation.create!(name: "Robinets",
                               description: "My faucets collection",
                               public: true,
                               user: User.last)
warhammer = Compilation.create!(name: "Warhammer",
                                description: "My warhammer collection",
                                public: true,
                                user: User.last)
castles = Compilation.create!(name: "Castles",
                              description: "My castles collection",
                              public: true,
                              user: User.last)

Tag.destroy_all
jumbo = Tag.create!(word: 'Jumbo')
vintage = Tag.create!(word: 'Vintage')
sofubi = Tag.create!(word: 'Sofubi')
mtg = Tag.create!(word: 'MTG')
blue = Tag.create!(word: 'Blue')
movie = Tag.create!(word: 'Movie')
yugioh = Tag.create!(word: 'YuGiOh')
pokemon = Tag.create!(word: 'Pokemon')
disney = Tag.create!(word: "Disney")
ferrari = Tag.create!(word: "Ferrari")
politic = Tag.create!(word: "politic")
history = Tag.create!(word: "history")
philosophy = Tag.create!(word: "philosophy")
chess = Tag.create!(word: "chess")
rat = Tag.create!(word: "rat")
fish = Tag.create!(word: "fish")
toy = Tag.create!(word: "toy")
collec = Tag.create!(word: "collec")
vig = Tag.create!(word: "videogame")
banger = Tag.create!(word: 'banger')
red = Tag.create!(word: 'red')

Tag.create!(word: Faker::Name.first_name)
Tag.create!(word: Faker::Name.first_name)
Tag.create!(word: Faker::Name.first_name)
Tag.create!(word: Faker::Name.first_name)
Tag.create!(word: Faker::Name.first_name)
Tag.create!(word: Faker::Name.first_name)
Tag.create!(word: Faker::Name.first_name)
Tag.create!(word: Faker::Name.first_name)
Tag.create!(word: Faker::Name.first_name)
Tag.create!(word: Faker::Name.first_name)
Tag.create!(word: Faker::Name.first_name)
Tag.create!(word: Faker::Name.first_name)
Tag.create!(word: Faker::Name.first_name)
Tag.create!(word: Faker::Name.first_name)
Tag.create!(word: Faker::Name.first_name)
Tag.create!(word: Faker::Name.first_name)
Tag.create!(word: Faker::Name.first_name)
Tag.create!(word: Faker::Name.first_name)

ItemsTag.destroy_all

Item.destroy_all

# Unicorns
unicorn = Item.create!(name: "The Last Unicorn",
                       compilation: unicorns,
                       description: "a unicorn I saw in the forest",
                       year: 1555,
                       owned: false)
unicorn.photo.attach(io: URI.open("https://i0.wp.com/farefwd.com/wp-content/uploads/2022/11/last-unicorn-2.png"), filename: "unicorn", content_type: "image/png")
ItemsTag.create!(item: unicorn, tag: vintage)
ItemsTag.create!(item: unicorn, tag: movie)
ItemsTag.create!(item: unicorn, tag: history)
ItemsTag.create!(item: unicorn, tag: rat)

new_item = Item.create!(name: 'Unicorn Lamp',
                        compilation: unicorns,
                        description: 'light of the unicorns',
                        year: 2000,
                        owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/6v4wr4kyixzdatoinsy1q7gyv6gy'),
                      filename: new_item.name,
                      content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Create your unicorn',
                        compilation: unicorns,
                        description: 'lets do it',
                        year: 2000,
                        owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/csdga8s62b5vjxm05ai5ohqb22ip'),
                      filename: new_item.name,
                      content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Handsome licorn',
                        compilation: unicorns,
                        description: 'da licornu',
                        year: 2000,
                        owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/5myef6p9wm9jxmb1921r3rfaurap'),
                      filename: new_item.name,
                      content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Unicorn 1',
                        compilation: unicorns,
                        description: 'the first one',
                        year: 2000,
                        owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/n1dzgxh73jeyjo7iks67rzqnr155'),
                      filename: new_item.name,
                      content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Star unicorn',
                        compilation: unicorns,
                        description: 'famous one',
                        year: 2000,
                        owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/sgpsxn0cpbmo5j74lc6ou336vp4t'),
                      filename: new_item.name,
                      content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'UniGod',
                        compilation: unicorns,
                        description: 'God of all the unicorns',
                        year: 2000,
                        owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/iul3mswpamwne80qmvske2rh2ov2'),
                      filename: new_item.name,
                      content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Fog unicorn',
                        compilation: unicorns,
                        description: 'foggy',
                        year: 2000,
                        owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/1xci77hybm2xkemnvyxgamlmrf29'),
                      filename: new_item.name,
                      content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Small one',
                        compilation: unicorns,
                        description: 'a small one',
                        year: 2000,
                        owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/wk9d6kguerbkativbaf09uqu66le'),
                      filename: new_item.name,
                      content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Photoshop',
                        compilation: unicorns,
                        description: 'd<yugfuq',
                        year: 2000,
                        owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/8bn1jhr1s6dq2zp5c2zwadt0s2dg'),
                      filename: new_item.name,
                      content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Unicorn and child',
                        compilation: unicorns,
                        description: 'babycorn',
                        year: 2000,
                        owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/cbsm6xqvgmmai2sw8k04prmnt9nz'),
                      filename: new_item.name,
                      content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Unicorns castle',
                        compilation: unicorns,
                        description: 'castle of the unicorns',
                        year: 2000,
                        owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/jxriifda0ueepvo9wz8kbpys8oj8'),
                      filename: new_item.name,
                      content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
print "Unicorns done\n\n"

# Cars
new_item = Item.create!(name: 'Blue car',
                        compilation: cars,
                        description: 'it\'s fast',
                        year: 2000,
                        owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/qlb4ymz893682ztszsz14jc9oitr'),
                      filename: new_item.name,
                      content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
ItemsTag.create!(item: new_item, tag: blue)

new_item = Item.create!(name: 'a car',
                        compilation: cars,
                        description: 'vroom vroom',
                        year: 2000,
                        owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/h0tphdobhfl8twjj4lv2xw1mgj7o'),
                      filename: new_item.name,
                      content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: ferrari)

new_item = Item.create!(name: 'red car',
  compilation: cars,
  description: 'it is red',
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/2cbb6g3gui325tau74rrpfsddojy'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: red)

new_item = Item.create!(name: 'also red car',
  compilation: cars,
  description: 'faster',
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/2cakds40nvx89lwfhc8g16tjxu90'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
ItemsTag.create!(item: new_item, tag: red)

new_item = Item.create!(name: 'grey car',
  compilation: cars,
  description: 'haha fast  car goes vroom',
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/wuumgnggcf31k8356b3et03btra8'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'black car',
  compilation: cars,
  description: 'in the night',
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/xicgppn92l9s1wgxl4g10fkni95y'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'amely car',
  compilation: cars,
  description: 'sold',
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/tct4w8fwsmh3rwhjrxnd9i2qqvx1'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
ItemsTag.create!(item: new_item, tag: red)

new_item = Item.create!(name: 'carrr',
  compilation: cars,
  description: 'a Carrrr',
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/w1jdsvr671b6mb3lfj3obome0ss0'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'White car',
  compilation: cars,
  description: 'a white car, pretty fast uh',
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/es94gi26oq6xgob83p1oouesdpmh'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: "Lambo",
  compilation: cars,
  description: "A really fast car.",
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/annwvd1f2tevautox5jbwj2oi3hb'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: blue)
ItemsTag.create!(item: new_item, tag: history)
print "Cars done\n\n"

# Hats
new_item = Item.create!(name: 'Black hat',
  compilation: hats,
  description: 'a black hat',
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/a6cwjscxjiu5fs318b04c5yojt28'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Black hat',
  compilation: hats,
  description: 'a black hat',
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/b6e3xaawm9wplwbtaya1cua1kgat'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Another black hat',
  compilation: hats,
  description: 'this one is also black',
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/0r65x56xwx8f07e8jqsez5i2zkx8'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Gray bob',
  compilation: hats,
  description: 'cender bob',
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/0hds12squdw7zmjbs1d5ac8wsujq'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Summer hat',
  compilation: hats,
  description: 'good for sun',
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/qd88hczm1agcdol78re8wyfhl2f5'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Haut de forme',
  compilation: hats,
  description: 'classy hat',
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/3k1frav8zqc2br6o4m2qcbly7kk7'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'fox bob',
  compilation: hats,
  description: 'hehe',
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/gfgjiit40p5or2li4u494k5q14ca'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Cool hat',
  compilation: hats,
  description: 'You\'ll stay cool',
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/1rsw7kr16rf0pwysvbqk7h47fp0z'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
print "Hats done\n\n"

# Castles
new_item = Item.create!(name: 'Castle 1',
  compilation: castles,
  description: 'My first castle',
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/4bxk6rdor6cz1a00jnk5jo6jjexa'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Castle 2',
  compilation: castles,
  description: 'My second castle',
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/37fcxmacajahhiggimhjat65q7bx'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Huge Castle',
  compilation: castles,
  description: 'my big castle',
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/r4jympglsmdhkh154ss4md0ty2sf'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Old castle',
  compilation: castles,
  description: 'it\'s so old',
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/ztpcstny62jggb0ral7b98ens454'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Lake castle',
  compilation: castles,
  description: 'near water',
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/zanzlstoxiww7w02z8akj9qi7as5'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Alala castle',
  compilation: castles,
  description: 'Castle of Alala',
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/pm2xaod0wywdg9c7lv0m035nhxzv'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Already castle',
  compilation: castles,
  description: 'you know this one',
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/z6aitwvznc4jrlew5bz30er6k5tp'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Castle 8',
  compilation: castles,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/5c7io26zspf8xyw5gnbwnio26e7f'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: castles,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/b3y2jxhy55zvaxf7lkve3uo62wc8'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'German castle',
  compilation: castles,
  description: 'my humble property in Germany',
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/ph273aoycrccqqqcs2bmjvrg6e8c'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Sunset castle',
  compilation: castles,
  description: 'It is always sunset in this castle',
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/458c0d79fci7bkno9cxa4ldojd75'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Color castle',
  compilation: castles,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/swonzcotalt8tw65r7k5jnvselwk'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: castles,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/1dq9iizz2bt0hr7h2zd6irz3n9vc'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: castles,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/px2t5jqgfyhisk9r7a0i53sdldhr'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
print "Castles done\n\n"

# Rocks
new_item = Item.create!(name: 'Colored rocks',
  compilation: rocks,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/z8t6s4x82du1n81af68sdh2fjx0w'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: rocks,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/x23b4ssqfpjkj29f61ovamjphlkq'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: rocks,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/a9r693gc97g9o6vov7ii5hwxsnfb'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: rocks,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/5wbmj11ioow31t8hmbtx4e6iue8n'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: rocks,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/n1v9tzdtf5zd7berxyoemvnx78ji'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: rocks,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/v694qnsg3sigiygxpu7pc9ang45q'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: rocks,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/56s6gn113i420r81w992jpfs34co'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: "The Rock",
  compilation: rocks,
  description: "Lay the Smackdown!",
  year: 1972,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/hh6v0wlxokp1fhdw81k3653a3kn5'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: blue)
ItemsTag.create!(item: new_item, tag: history)
print "Rocks done\n\n"

# Stamps
new_item = Item.create!(name: Faker::Name.first_name,
  compilation: stamps,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/e7606d03j5vwor1gkb06yltq5j6n'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: stamps,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/2jz0xtu3br0bj6j29tb58nisojwr'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: stamps,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/zi8eo6chat2oitky44w0m6gx7bez'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: stamps,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/wkra1p7thzs99k6drhfm937f7x4z'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: stamps,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/z9zhny1zm7u8t4egqrn9e30qydas'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: stamps,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/w94fpl2zyvd73gl6l2f5aame8d1b'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: stamps,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/mt3ufldb0hagnybszofaus0gpqbe'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: stamps,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/lb97cmz2arc2he0vu6d3y9sza6n3'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: stamps,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/ygwpklrzjjmlan5twpljeqcapfs6'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: stamps,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/2uiyg206xqiiyzss3sy3te33nfnx'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
print "Stamps done\n\n"

# Plants
new_item = Item.create!(name: Faker::Name.first_name,
  compilation: plants,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/o9h2hc60cjgnw1wtmuqdun7ofhyc'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: plants,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/vtrgcgdmmlr5n7n2yaab12vl64s8'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: plants,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/pz8ahzhl1xxj0wmlcqa1x3zqh6ye'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: plants,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/jgemlu60rw3scsmxggigccu34zbd'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: plants,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/4wpsi81nggp7n9c6l0gcmje18mym'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: plants,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/l00q9e366dk5w60xdyermlb6y795'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: plants,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/9sbfli25reecf8tkge5d27qr8kp8'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: plants,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/p345njvflupcp6zrzb8yhvgk3ieb'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: plants,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/g7jo2mmf541lj424y2lsozlvyz11'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
print "Plants done\n\n"

# Robinets
new_item = Item.create!(name: 'Golden faucet',
  compilation: robinets,
  description: 'expensive one',
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/z9ocvitcv7qsqk43988lc25aeo1f'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Black faucet',
  compilation: robinets,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/t7cmfluab0xr2m48xhdoovjzi0ru'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Water faucet',
  compilation: robinets,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/z8z738m9bmpgtsu0blu1cvk7w001'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Robinet faucet',
  compilation: robinets,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/r0fcmdpjhbse95cplfjuh140dybx'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Faucet faucet',
  compilation: robinets,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/yedwxyrb1lqscr8tnntfewoua9p4'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Faucet robinet',
  compilation: robinets,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/357dfvcopq4m2c03wqlq4teaxt4z'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Robinet robinet',
  compilation: robinets,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/qnx9ey5tukw2udvf9w3arridu1b6'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Robinet qui fonctionne pas',
  compilation: robinets,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/gy08rhoklait2yyg3deytuw5153d'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
print "Robinet done\n\n"

# Sneakers
new_item = Item.create!(name: Faker::Name.first_name,
  compilation: sneakers,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/p95mgh9q9cdresjjtbqmi4a9xgmp'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: sneakers,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/wao8mdv1tgl9u9l3bdhq81a1egsa'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: sneakers,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/a6x0oj822fijcbm6ldh1r197t1pd'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: sneakers,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/h35ceka6xxjxjvort6ulbudpv8i9'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: sneakers,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/oaoqe6pffwwz3n5m216lw7ctqjmw'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: sneakers,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/d1ebqbe6310mbx1r9u4ef0xl6day'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: sneakers,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/03o533cnkp1v9wo3m1x2s5cmuz0q'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: sneakers,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/lvboblvkgzq5igrlb694fr0tyq1v'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: sneakers,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/81no42h75qg527m3f059soyryqa9'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: sneakers,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/l6j2mvvgj89h679e3jpr2ght8wmb'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: "Sneaker",
  compilation: sneakers,
  description: "The shoes",
  year: 1970,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/0gqlgysxqnvbei83q7r9bo9w1obu'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: blue)
ItemsTag.create!(item: new_item, tag: history)
print "Sneakers done\n\n"

# PS1
new_item = Item.create!(name: 'Castlevania',
  compilation: ps1,
  description: 'Good vampire game',
  year: 1990,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/sgsnq8tloit6oru8qj24kg7d3gux'),
filename: new_item.name,
content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: vig)
vampire = Tag.create!(word: 'vampire')
ItemsTag.create!(item: new_item, tag: vampire)

new_item = Item.create!(name: 'Dark Forces',
  compilation: ps1,
  description: 'A Star Wars game on ps1',
  year: 1991,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/b61d1qmvm1cc4r7ugj1rgurm2r7d'),
filename: new_item.name,
content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: vig)
starwars = Tag.create!(word: 'starwars')
ItemsTag.create!(item: new_item, tag: starwars)

new_item = Item.create!(name: 'FF VII',
  compilation: ps1,
  description: 'Final Fantasy 7, an all time classic',
  year: 1992,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/i0gr52ckd7wwswmh15my1ueb9iir'),
filename: new_item.name,
content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: banger)

new_item = Item.create!(name: 'Sonic and Spyro',
  compilation: ps1,
  description: 'Two of my fav games',
  year: 1993,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/bkydexn9ms4d8ghsqz53025urv8v'),
filename: new_item.name,
content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
ItemsTag.create!(item: new_item, tag: banger)

new_item = Item.create!(name: 'Fear effect',
  compilation: ps1,
  description: 'Are you scared?',
  year: 1994,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/mreo2dtxizv5vxghe93vvksohjv7'),
filename: new_item.name,
content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
horror = Tag.create!(word: 'horror')
ItemsTag.create!(item: new_item, tag: horror)
ItemsTag.create!(item: new_item, tag: vig)

new_item = Item.create!(name: 'The Legend of Dragoon',
  compilation: ps1,
  description: 'Quite a tell if you ask me!',
  year: 1995,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/8puuedhsud7pa9rdz05mv2jg4abg'),
filename: new_item.name,
content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
adventure = Tag.create!(word: 'adventure')
ItemsTag.create!(item: new_item, tag: adventure)
ItemsTag.create!(item: new_item, tag: vig)

new_item = Item.create!(name: 'Mega Man Legends',
  compilation: ps1,
  description: 'The little bomb man legend',
  year: 1996,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/ci3w0uc9285xyzi71c5044hm09c2'),
filename: new_item.name,
content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
action = Tag.create!(word: 'action')
ItemsTag.create!(item: new_item, tag: action)
ItemsTag.create!(item: new_item, tag: vig)

new_item = Item.create!(name: 'Rival Schools',
  compilation: ps1,
  description: 'A battle game',
  year: 1997,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/kftj2ajpzbsgssihsbwzqtfv8x95'),
filename: new_item.name,
content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
combat = Tag.create!(word: 'combat')
ItemsTag.create!(item: new_item, tag: combat)
school = Tag.create!(word: 'school')
ItemsTag.create!(item: new_item, tag: school)
ItemsTag.create!(item: new_item, tag: vig)

new_item = Item.create!(name: 'Grandia',
  compilation: ps1,
  description: 'An extremely beautiful and top quality gameplay experience japanese rpg',
  year: 1998,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/dh4eiym4s6x86neilmlsq86at8gd'),
filename: new_item.name,
content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
rpg = Tag.create!(word: 'rpg')
ItemsTag.create!(item: new_item, tag: rpg)
ItemsTag.create!(item: new_item, tag: combat)
ItemsTag.create!(item: new_item, tag: adventure)
ItemsTag.create!(item: new_item, tag: vig)

new_item = Item.create!(name: 'Rayman And Ridge Racer',
  compilation: ps1,
  description: 'Why together?',
  year: 1999,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/mrhcwm9b4nal1olw1qs4dazdpum1'),
filename: new_item.name,
content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
platform = Tag.create!(word: 'platform')
ItemsTag.create!(item: new_item, tag: platform)
ItemsTag.create!(item: new_item, tag: vig)

new_item = Item.create!(name: 'Overboard',
  compilation: ps1,
  description: 'fun game lol',
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/8dax5mhp94nqt6pnm4r8tmzwy8i6'),
filename: new_item.name,
content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
boat = Tag.create!(word: 'boat')
ItemsTag.create!(item: new_item, tag: boat)
ItemsTag.create!(item: new_item, tag: vig)

new_item = Item.create!(name: '3 games',
  compilation: ps1,
  description: '3 for the price of one',
  year: 1990,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/1xgtqq7loeotshottkdz4bme2plm'),
filename: new_item.name,
content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
ItemsTag.create!(item: new_item, tag: action)
ItemsTag.create!(item: new_item, tag: vig)

new_item = Item.create!(name: 'Crash Bandicoot PS1',
  compilation: ps1,
  description: 'A marvelous platform game.',
  year: 1996,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/q3e72yyp3u9xlfjykuxea7wudkle'),
filename: new_item.name,
content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
ItemsTag.create!(item: new_item, tag: vig)
ItemsTag.create!(item: new_item, tag: action)
ItemsTag.create!(item: new_item, tag: platform)

new_item = Item.create!(name: 'Playstation 1',
  compilation: ps1,
  description: 'Miracle of technology.',
  year: 1994,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/df5wm874hcwreurvkcpiww51rude'),
filename: new_item.name,
content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
ItemsTag.create!(item: new_item, tag: vig)
console = Tag.create!(word: 'console')
ItemsTag.create!(item: new_item, tag: console)
print "PS1 done\n\n"

# Figures
doragiras = Item.create!(name: 'Doragiras',
  compilation: figures,
  description: 'Doragiras Marusan 1971',
  year: 1971,
  owned: true)
doragiras.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/3ox61etdpui68klvfcodwqxtvyw3'),
filename: 'doragiras',
content_type: 'image/jpg')
ItemsTag.create!(item: doragiras, tag: sofubi)
ItemsTag.create!(item: doragiras, tag: jumbo)
ItemsTag.create!(item: doragiras, tag: vintage)

new_item = Item.create!(name: 'Goro Wind-up Marusan X Tomy',
 compilation: figures,
 description: 'A rare piece',
 year: 1975,
 owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/gy9dvh1ek6vtfcfwlbwzflnqr2ez'),
filename: new_item.name,
content_type: 'image/jpg')
windup = Tag.create!(word: 'wind-up')
ItemsTag.create!(item: new_item, tag: windup)
marusan = Tag.create!(word: 'marusan')
ItemsTag.create!(item: new_item, tag: marusan)
ItemsTag.create!(item: new_item, tag: vintage)

new_item = Item.create!(name: 'Metlar Inhumanoids',
 compilation: figures,
 description: 'Iconic piece from the 80s',
 year: 1980,
 owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/v6wbzvuwl982tgvp5kb7akyrawqo'),
filename: new_item.name,
content_type: 'image/jpg')
retro = Tag.create!(word: 'retro')
ItemsTag.create!(item: new_item, tag: retro)

new_item = Item.create!(name: 'Pegyaos',
 compilation: figures,
 description: 'Kaiju sofubi pachikaiju bootleg',
 year: 1970,
 owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/jlxdu0643468u1c35c5hnlmrsbss'),
filename: new_item.name,
content_type: 'image/jpg')
bootleg = Tag.create!(word: 'bootleg')
ItemsTag.create!(item: new_item, tag: bootleg)
ItemsTag.create!(item: new_item, tag: vintage)
ItemsTag.create!(item: new_item, tag: sofubi)
ItemsTag.create!(item: new_item, tag: red)

new_item = Item.create!(name: 'Hong Kong Monkey',
 compilation: figures,
 description: 'HOU HOU HOU',
 year: 1975,
 owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/3h99kkne4hj83bq6cg2k4xqh9j70'),
filename: new_item.name,
content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: bootleg)
ItemsTag.create!(item: new_item, tag: vintage)

new_item = Item.create!(name: 'Miura Wrinkle Monster',
 compilation: figures,
 description: 'Pachi, very beautiful, around 500$',
 year: 1970,
 owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/icuj5k63q3st2xjlkey0np7653oe'),
filename: new_item.name,
content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: vintage)
ItemsTag.create!(item: new_item, tag: bootleg)

new_item = Item.create!(name: 'Godzilla Collection Logo',
 compilation: figures,
 description: 'Our logo;)',
 year: 2023,
 owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/6fcqcexfei38j60e4pxs3qjvdnnv'),
filename: new_item.name,
content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Banana Oil King Godzilla',
 compilation: figures,
 description: 'Lamp pachikaiju King Godzilla',
 year: 1971,
 owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/7se2w08tiy7zxgcfwqq15oo564of'),
filename: new_item.name,
content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: vintage)
ItemsTag.create!(item: new_item, tag: bootleg)
ItemsTag.create!(item: new_item, tag: red)
ItemsTag.create!(item: new_item, tag: jumbo)

new_item = Item.create!(name: 'Baragon',
 compilation: figures,
 description: 'Baragon, very rare and amazing piece from marusan 1966',
 year: 1966,
 owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/qfe1eo3r799ujldqtfiyfyb6snoi'),
filename: new_item.name,
content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: vintage)
ItemsTag.create!(item: new_item, tag: marusan)
ItemsTag.create!(item: new_item, tag: sofubi)

new_item = Item.create!(name: 'Berobero & Garigari',
 compilation: figures,
 description: 'Duo from a vintage japanese tv show "Machaaki maetake hajimaru yo". Made by Bullmark',
 year: 1971,
 owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/ukp9y5o3r6vzuvd4ofsa99oae261'),
filename: new_item.name,
content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: sofubi)
ItemsTag.create!(item: new_item, tag: vintage)
bullmark = Tag.create!(word: 'Bullmark')
ItemsTag.create!(item: new_item, tag: bullmark)

new_item = Item.create!(name: 'King Gizara',
 compilation: figures,
 description: 'Art toy by gumtaro, gold glitter version, unique',
 year: 2019,
 owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/dnynqld9224aq743mqqrif3te8qh'),
filename: new_item.name,
content_type: 'image/jpg')
gumtaro = Tag.create!(word: 'Gumtaro')
ItemsTag.create!(item: new_item, tag: gumtaro)
art = Tag.create!(word: 'art')
ItemsTag.create!(item: new_item, tag: art)
ItemsTag.create!(item: new_item, tag: sofubi)

new_item = Item.create!(name: 'Goro',
 compilation: figures,
 description: 'Goro windup',
 year: 1970,
 owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/br0xqo1yo32a786s0o1ruwkwgere'),
filename: new_item.name,
content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
ItemsTag.create!(item: new_item, tag: windup)

new_item = Item.create!(name: 'Gorosaurus',
 compilation: figures,
 description: 'Marusan Gorosaurus from Godzilla, 66',
 year: 1966,
 owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/72g7nafj9nzkrejfsnk2z9av1kgx'),
filename: new_item.name,
content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: sofubi)
ItemsTag.create!(item: new_item, tag: vintage)
ItemsTag.create!(item: new_item, tag: marusan)
ItemsTag.create!(item: new_item, tag: blue)

new_item = Item.create!(name: 'Small Godzilla by Popy',
 compilation: figures,
 description: 'Popy figure, exist in 3 sizes',
 year: 1980,
 owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/1z81sqq3791a4iejo77j8fp1zwqj'),
filename: new_item.name,
content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Marusan Vintage Godzilla Robot',
 compilation: figures,
 description: 'Legendary trio',
 year: 1960,
 owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/ni4zg0zl8qx4k85nf6sfogkdr7jm'),
filename: new_item.name,
content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

godzilla = Item.create!(name: "Godzilla",
 compilation: figures,
 description: "Godzilla by marusan from 1966",
 year: 1966,
 owned: true)
godzilla.photo.attach(io: URI.open("https://i.pinimg.com/564x/fd/36/b2/fd36b216d5db83a2dca598049dedd1f3.jpg"), filename: "godzilla", content_type: "image/jpg")
ItemsTag.create!(item: godzilla, tag: sofubi)
ItemsTag.create!(item: godzilla, tag: vintage)
ItemsTag.create!(item: godzilla, tag: blue)
ItemsTag.create!(item: godzilla, tag: fish)
ItemsTag.create!(item: godzilla, tag: toy)
ItemsTag.create!(item: godzilla, tag: politic)
ItemsTag.create!(item: godzilla, tag: philosophy)
print "Figures done\n\n"

# Cards
new_item = Item.create!(name: 'Agatha Soul Cauldron',
                        compilation: cards,
                        description: 'Good in Hardened Scales',
                        year: 2023,
                        owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/c1z03kj85q65c3vnizgas6x2dpt2'),
                      filename: new_item.name,
                      content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: mtg)
ItemsTag.create!(item: new_item, tag: collec)

new_item = Item.create!(name: 'Ancient Stirring',
                        compilation: cards,
                        description: 'for colorless decks',
                        year: 2000,
                        owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/p3ajj9j1g5d2uly2eacf7r8tel4a'),
                      filename: new_item.name,
                      content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: mtg)
ItemsTag.create!(item: new_item, tag: collec)

new_item = Item.create!(name: 'Basilisk collar',
                        compilation: cards,
                        description: 'combo with ballist',
                        year: 2000,
                        owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/ymd1olwdvjctp5pxrvsccz11etn7'),
                      filename: new_item.name,
                      content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: mtg)
ItemsTag.create!(item: new_item, tag: collec)

new_item = Item.create!(name: 'Springleaf drum',
                        compilation: cards,
                        description: 'Fast mana',
                        year: 2000,
                        owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/i7iq2pg69mrt27a2om5yphgenw60'),
                      filename: new_item.name,
                      content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
ItemsTag.create!(item: new_item, tag: mtg)
ItemsTag.create!(item: new_item, tag: collec)

new_item = Item.create!(name: 'Hangarback Walker',
                        compilation: cards,
                        description: 'combo piece',
                        year: 2000,
                        owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/px3mfxzcjchqz1wd6wfxmxiuji4e'),
                      filename: new_item.name,
                      content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: mtg)
ItemsTag.create!(item: new_item, tag: collec)

new_item = Item.create!(name: 'The Ozolith',
                        compilation: cards,
                        description: 'So good',
                        year: 2000,
                        owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/d61wxlk80dx6tyai1ssgnbh6flk5'),
                      filename: new_item.name,
                      content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: mtg)
ItemsTag.create!(item: new_item, tag: collec)

new_item = Item.create!(name: 'Patchwork automaton',
                        compilation: cards,
                        description: 'beatdown plan',
                        year: 2022,
                        owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/w3pr3yt3ll1a6ikezjsinlqizrb5'),
                      filename: new_item.name,
                      content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: mtg)
ItemsTag.create!(item: new_item, tag: collec)

new_item = Item.create!(name: 'Arcbound Ravager',
                        compilation: cards,
                        description: 'Main card',
                        year: 2000,
                        owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/cmd5qd6aptlu2grfo87ujcqg0o1w'),
                      filename: new_item.name,
                      content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: mtg)
ItemsTag.create!(item: new_item, tag: collec)

new_item = Item.create!(name: 'Ozolith shattered spire',
                        compilation: cards,
                        description: 'extra scales',
                        year: 2000,
                        owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/g544xopv6ywag9vm6umy3kodt831'),
                      filename: new_item.name,
                      content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: mtg)
ItemsTag.create!(item: new_item, tag: collec)

new_item = Item.create!(name: 'Tamiyo safekeeping',
                        compilation: cards,
                        description: 'to go all in',
                        year: 2021,
                        owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/wlxdeyxouorvdo4ysib1ec61wrlc'),
                      filename: new_item.name,
                      content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: mtg)
ItemsTag.create!(item: new_item, tag: collec)

new_item = Item.create!(name: 'Walking ballista',
                        compilation: cards,
                        description: 'finisher',
                        year: 2000,
                        owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/sdghp7q8ty0xs3u5sqabaiayre4c'),
                      filename: new_item.name,
                      content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
ItemsTag.create!(item: new_item, tag: mtg)
ItemsTag.create!(item: new_item, tag: collec)

new_item = Item.create!(name: 'Welding jar',
                        compilation: cards,
                        description: 'for protection',
                        year: 2000,
                        owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/y8avmwbhtxb59eftc1dlwabcmob3'),
                      filename: new_item.name,
                      content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: mtg)
ItemsTag.create!(item: new_item, tag: collec)

new_item = Item.create!(name: 'Zabaz, glimmerwasp',
                        compilation: cards,
                        description: 'good 1 drop',
                        year: 2000,
                        owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/9syn3hg66xpmny03ml7eve275gs6'),
                      filename: new_item.name,
                      content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: mtg)
ItemsTag.create!(item: new_item, tag: collec)

chaos_orb = Item.create!(name: "Chaos Orb",
  compilation: cards,
  description: "Chaos Orb Alpha 1993",
  year: 1993,
  owned: true)
chaos_orb.photo.attach(io: URI.open("https://cdn11.bigcommerce.com/s-641uhzxs7j/images/stencil/1280x1280/products/325450/352438/LEA235__16312.1631683359.png"), filename: "chaos_orb", content_type: "image/png")
ItemsTag.create!(item: chaos_orb, tag: mtg)
ItemsTag.create!(item: chaos_orb, tag: collec)
ItemsTag.create!(item: chaos_orb, tag: vintage)
ItemsTag.create!(item: chaos_orb, tag: yugioh)
ItemsTag.create!(item: chaos_orb, tag: pokemon)
ItemsTag.create!(item: chaos_orb, tag: chess)
print "Cards done\n\n"

#Lorcana
new_item = Item.create!(name: 'Lorcana Illumineer\'s Trove',
  compilation: lorcana,
  description: 'Very valuable good',
  year: 2023,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/rwtos1vcbi54hxcem1exyski4qcw'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
ItemsTag.create!(item: new_item, tag: disney)

new_item = Item.create!(name: 'cards',
  compilation: lorcana,
  description: 'some cards',
  year: 2023,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/evl2ra6qwfkc00ydlcc6d09gbhou'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
ItemsTag.create!(item: new_item, tag: disney)

new_item = Item.create!(name: 'Starter decks',
  compilation: lorcana,
  description: 'the three starters from chapter 1',
  year: 2023,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/l3f4dqkbw962vqj1ln5gtpbi64br'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
ItemsTag.create!(item: new_item, tag: disney)

new_item = Item.create!(name: 'Lorcana products',
  compilation: lorcana,
  description: 'the products',
  year: 2023,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/fkk8oro1vcox1zg6va80z9ry2p6b'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: disney)

new_item = Item.create!(name: 'Paper cards',
  compilation: lorcana,
  description: 'cards',
  year: 2023,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/5bqjj0xwn736nq2ljnfatm0foy1k'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: 'Legendary',
  compilation: lorcana,
  description: 'rare',
  year: 2023,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/brgc5avf1wupsg1z6opj0hkg4wnr'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
ItemsTag.create!(item: new_item, tag: disney)

new_item = Item.create!(name: 'Booster Box',
  compilation: lorcana,
  description: 'a booster box (24 packs)',
  year: 2023,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/ot40598gxaimieqp7e5hewxg5a0l'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: disney)

new_item = Item.create!(name: 'Maleficent and Mickey',
  compilation: lorcana,
  description: 'quite a duo',
  year: 2023,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/4rvcdj0k4h7gasqzemndbzozm1gg'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
ItemsTag.create!(item: new_item, tag: disney)

new_item = Item.create!(name: 'lorcana',
  compilation: lorcana,
  description: 'lorcana',
  year: 2023,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/im8mkgegjj2eczkgm6g09hi2nog9'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: disney)

new_item = Item.create!(name: "Mickey Mouse, Brave Little Tailor",
  compilation: lorcana,
  description: "A really good finisher",
  year: 2023,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/uwwlvzpl1czmthmw6wkph2dfu12u'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: blue)
ItemsTag.create!(item: new_item, tag: history)
ItemsTag.create!(item: new_item, tag: disney)
print "Lorcana done\n\n"

# Warhammer
new_item = Item.create!(name: Faker::Name.first_name,
  compilation: warhammer,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/8ttjmn9o0jlxxyzg7oimcnbs8l0p'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: warhammer,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/wvqa5u7orr84bbdtyla1c49wm0hy'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: warhammer,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/di9m0wi3dlyu4y27ah75iut8zn7q'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: warhammer,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/ozkulhrlebgs8pi6ieyi59wg1lmv'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: warhammer,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/7b6qc4qjfougtkcd25jod8v5ep3l'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: warhammer,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/zet03kmgcv24x4qfn7galhwd6zu1'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: warhammer,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/zet03kmgcv24x4qfn7galhwd6zu1'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: warhammer,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/s6umw462sgq2e4l81rbnoukrhm7u'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: warhammer,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/9vui2rdikgfybl3nnxwihbmkebmb'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: warhammer,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/w6m402o347ag46bjr0txa6r3z6ir'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: warhammer,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/f06obytrplyk7fqeew65ethxb7w3'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)

new_item = Item.create!(name: Faker::Name.first_name,
  compilation: warhammer,
  description: Faker::Quote.famous_last_words,
  year: 2000,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/lwrugxu14am130e50mggk9ddockv'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: Tag.all.sample)
print "Warhammer done\n\n"

# Paintings
new_item = Item.create!(name: 'Beheaded fashionista',
  compilation: paintings,
  description: 'masterpiece from Hungary',
  year: 1475,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/jjxa8t0oowofeitbwigjh9u3dku5'),
  filename: new_item.name,
  content_type: 'image/jpg')
paint = Tag.create!(word: 'paint')
ItemsTag.create!(item: new_item, tag: paint)

new_item = Item.create!(name: 'Monarch waiting',
  compilation: paintings,
  description: 'Legends says he is still waiting',
  year: 1865,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/qtqxfdygt29efuxnsp59bnsb8nbh'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: paint)

new_item = Item.create!(name: 'Da Christ',
  compilation: paintings,
  description: 'he is the son of God',
  year: 888,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/vx0lxedr8qfcu5zonhg99n2gp3e7'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: paint)

new_item = Item.create!(name: 'A scene',
  compilation: paintings,
  description: 'nice painting',
  year: 777,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/qvwplj7h3dnoabttp2jsf17sk2z8'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: paint)

new_item = Item.create!(name: 'Self-protrait',
  compilation: paintings,
  description: 'It is me',
  year: 1333,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/cn7jsjjreufqek0t9cody3pmgdxv'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: paint)

new_item = Item.create!(name: 'Christ is dead',
  compilation: paintings,
  description: 'Oh no!',
  year: 666,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/4p6euy9drdauhi8ucdjpub6i3i5f'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: paint)

new_item = Item.create!(name: 'The talking',
  compilation: paintings,
  description: 'painting from renaissance era, personal collec',
  year: 1559,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/08klupd6vva72hav3ih7abh1u4us'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: paint)

new_item = Item.create!(name: 'Alamy',
  compilation: paintings,
  description: 'a nice painting',
  year: 564,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/5j7vutrymizqfb7scewiczmxd54v'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: paint)

new_item = Item.create!(name: 'Roman',
  compilation: paintings,
  description: 'Amazing piece of art, love it',
  year: 1775,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/mex1pwe1bek7u4lvx02ta957luw7'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: paint)

new_item = Item.create!(name: 'Touch mu fingu',
  compilation: paintings,
  description: 'finger touchy',
  year: 4559,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/qf74dly655thanzfu9l8p7c71x64'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: paint)

new_item = Item.create!(name: 'smally',
  compilation: paintings,
  description: 'gg',
  year: 1236,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/c2n95b189x5u0ncz3cl1h1dzrwys'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: paint)

new_item = Item.create!(name: "Bellemare, La Naissance de la Vierge",
  compilation: paintings,
  description: "Marie est la, célébrons le chocolat.",
  year: 1500,
  owned: true)
new_item.photo.attach(io: URI.open('https://res.cloudinary.com/dhs2x2lmi/image/upload/v1/development/08klupd6vva72hav3ih7abh1u4us'),
  filename: new_item.name,
  content_type: 'image/jpg')
ItemsTag.create!(item: new_item, tag: paint)
print "Paintings done\n\n"
