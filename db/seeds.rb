# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.create([
  {
    name: "Señor Gourmet",
    imageUrl: "http://lorempixel.com/400/200",
    minPrice: 8000,
    maxPrice: 20000,
    location: "Bloque 4"
   },
   {
    name: "Donde Tavo",
    imageUrl: "http://lorempixel.com/400/200",
    minPrice: 5000,
    maxPrice: 20000,
    location: "Bloque 4"
   },
   {
    name: "Mandarina",
    imageUrl: "http://lorempixel.com/400/200",
    minPrice: 8000,
    maxPrice: 20000,
    location: "Bloque 12"
   }
])
