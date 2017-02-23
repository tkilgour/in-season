# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Seeding Data ..."

def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end