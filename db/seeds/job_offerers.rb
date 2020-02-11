# frozen_string_literal: true

admin = JobOfferer.create!(
  email: ENV['ADMIN_EMAIL'], password: ENV['ADMIN_PASSWORD'],
  confirmed_at: Time.now, admin: true
)
admin.create_profile!(
  first_name: ENV['ADMIN_FIRST_NAME'], last_name: ENV['ADMIN_LAST_NAME'],
  first_name_furigana: ENV['ADMIN_FIRST_NAME_FURIGANA'],
  last_name_furigana: ENV['ADMIN_LAST_NAME_FURIGANA'],
  bio: 'ご利用ありがとうございます。', tag_list: ['web系']
)
admin.profile.avatar.attach(
  io: File.open('db/sample/avatar/admin.jpeg'), filename: 'admin.jpeg'
)

guest = JobOfferer.create!(
  email: 'test_offerer@joblink.com', password: 'password',
  confirmed_at: Time.now
)
guest.create_profile!(
  first_name: '求人者', last_name: '名無しの',
  first_name_furigana: 'きゅうじんしゃ', last_name_furigana: 'ななしの',
  bio: '簡単ログイン中のユーザーです'
)
guest.profile.avatar.attach(
  io: File.open('db/sample/avatar/guest_offerer.jpeg'),
  filename: 'guest_offerer.jpeg'
)
