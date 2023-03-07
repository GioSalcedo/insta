# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(
  email: "gio@prueba.com",
  password: "123456",
  password_confirmation: "123456",
  username: "Gio",
  bio: "Hola, soy Gio",
  location: "La Estrella, Antioquia"
  )

    puts "1 User created"

User.create(
  email: "gio_dev@prueba.com",
  password: "123456",
  password_confirmation: "123456",
  username: "Gio_dev",
  bio: "Hola, soy Gio_dev",
  location: "La Estrella, Antioquia"
)

  puts "2 User created"
