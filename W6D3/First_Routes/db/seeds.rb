# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Artwork.destroy_all
User.destroy_all 

user1 = User.create({username: 'Bob Ross'})
user2 = User.create({username: 'Jim Bean'})
user3 = User.create({username: 'Robert Downey JR'})

art1 = Artwork.create([{title: 'Happy Trees'}, {image_url: 'Happy@trees.com'}, {artist_id: user1.id}])
art2 = Artwork.create([{title: 'Whiskey'}, {image_url: 'Friday@whiskey.com'}, {artist_id: user2.id}])
art3 = Artwork.create([{title: 'Iron Man'}, {image_url: 'RIP@trees.com'}, {artist_id: user3.id}])




