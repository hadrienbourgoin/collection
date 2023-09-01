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
               username: "test#{nbr}")
  new_user.photo.attach(io: URI.open("https://dessins-animes-hrd.appspot.com/img/dessins-animes/davidlegnome.jpg"), filename: "avatar", content_type: "image/jpg")
  print "#{5 - nbr} users left to create\n\n"
  nbr += 1
end

Compilation.destroy_all
Compilation.create!(name: "Figures",
                    description: "My figures collection",
                    public: true,
                    user: User.first)
Compilation.create!(name: "Cards",
                    description: "My cards collection",
                    public: true,
                    user: User.first)
Compilation.create!(name: "Cars",
                    description: "My cars collection",
                    public: false,
                    user: User.first)
Compilation.create!(name: "Stamps",
                    description: "My stamps collection",
                    public: true,
                    user: User.second)
Compilation.create!(name: "Plants",
                    description: "My plants collection",
                    public: true,
                    user: User.last)
Compilation.create!(name: "Unicorns",
                    description: "My unicorns collection",
                    public: false,
                    user: User.last)

Item.destroy_all
8.times do
  new_item = Item.create!(name: "Godzilla",
                          compilation: Compilation.first,
                          description: "test",
                          year: 1966,
                          owned: true)
  new_item.photo.attach(io: URI.open("https://i.pinimg.com/564x/fd/36/b2/fd36b216d5db83a2dca598049dedd1f3.jpg"), filename: "godzilla", content_type: "image/jpg")
end
2.times do
  new_item = Item.create!(name: "Doragiras",
                          compilation: Compilation.first,
                          description: "test",
                          year: 1971,
                          owned: false)
  new_item.photo.attach(io: URI.open("https://i.ebayimg.com/images/g/vn4AAOSwNBleg0Ct/s-l1600.jpg"), filename: "doragiras", content_type: "image/jpg")
end
8.times do
  new_item = Item.create!(name: "Chaos Orb",
                          compilation: Compilation.second,
                          description: "test",
                          year: 1993,
                          owned: true)
  new_item.photo.attach(io: URI.open("https://cdn11.bigcommerce.com/s-641uhzxs7j/images/stencil/1280x1280/products/325450/352438/LEA235__16312.1631683359.png"), filename: "chaos_orb", content_type: "image/jpg")
end
2.times do
  new_item = Item.create!(name: "The Last Unicorn",
                          compilation: Compilation.last,
                          description: "test",
                          year: 1555,
                          owned: false)
  new_item.photo.attach(io: URI.open("https://i0.wp.com/farefwd.com/wp-content/uploads/2022/11/last-unicorn-2.png"), filename: "unicorn", content_type: "image/jpg")
end

Tag.destroy_all
Tag.create!(word: "Jumbo")
Tag.create!(word: "Vintage")
Tag.create!(word: "Sofubi")
Tag.create!(word: "MTG")
Tag.create!(word: "Blue")
Tag.create!(word: "Movie")
Tag.create!(word: "YuGiOh")
Tag.create!(word: "Pokemon")
Tag.create!(word: "Disney")
Tag.create!(word: "Ferrari")
Tag.create!(word: "politic")
Tag.create!(word: "hystory")
Tag.create!(word: "phylosophy")
Tag.create!(word: "chess")
Tag.create!(word: "rat")
Tag.create!(word: "fish")
Tag.create!(word: "toy")
Tag.create!(word: "collec")

ItemsTag.destroy_all
3.times do
  ItemsTag.create!(item: Item.first,
                   tag: Tag.all.sample)
end
30.times do
  ItemsTag.create!(item: Item.all.sample,
                   tag: Tag.all.sample)
end
