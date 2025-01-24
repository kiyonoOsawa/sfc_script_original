# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
#  [ name: 'green', code: '48CFAE' ],
colors = [
  { name: 'green', code: '48CFAE', display_name: 'みどり' },
  { name: 'purple', code: 'AC92ED', display_name: 'むらさき' },
  { name: 'pink', code: 'EC87BF', display_name: 'ピンク' },
  { name: 'light_blue', code: '4FC0E8', display_name: 'みずいろ' },
  { name: 'blue', code: '5D9CEC', display_name: 'あお' },
  { name: 'yellow', code: 'FFCE55', display_name: 'きいろ' },
  { name: 'red', code: 'ED5466', display_name: 'あか' }
]

colors.each do |color|
  Color.find_or_create_by!(name: color[:name]) do |c|
    c.code = color[:code]
    c.display_name = color[:display_name]
  end
end
