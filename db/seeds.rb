# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = JobOfferer.create!(
  email: ENV['ADMIN_EMAIL'],
  password: ENV['ADMIN_PASSWORD'],
  confirmed_at: Time.now,
  admin: true
)
admin.create_profile!(
  first_name: '大暉',
  last_name: '上窪',
  first_name_furigana: 'だいき',
  last_name_furigana: 'うえくぼ',
  bio: 'ご利用ありがとうございます。'
)
