# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Color.create!(
  green: '48CFAE',
  purple: 'AC92ED',
  pink: 'EC87BF',
  light_blue: '4FC0E8',
  blue: '5D9CEC',
  yellow: 'FFCE55',
  red: 'ED5466'
)
