# frozen_string_literal: true

admin = JobOfferer.create!(
  email: ENV['ADMIN_EMAIL'], password: ENV['ADMIN_PASSWORD'],
  confirmed_at: Time.now, admin: true
)
admin.create_profile!(
  first_name: ENV['ADMIN_FIRST_NAME'], last_name: ENV['ADMIN_LAST_NAME'],
  first_name_furigana: ENV['ADMIN_FIRST_NAME_FURIGANA'],
  last_name_furigana: ENV['ADMIN_LAST_NAME_FURIGANA'],
  bio: 'ご利用ありがとうございます。'
)

test_offerer = JobOfferer.create!(
  email: 'test_offerer@joblink.com', password: 'password',
  confirmed_at: Time.now
)
test_offerer.create_profile!(
  first_name: '求人者', last_name: '名無しの',
  first_name_furigana: 'きゅうじんしゃ', last_name_furigana: 'ななしの',
  bio: '簡単ログイン中のユーザーです'
)

test_seeker = JobSeeker.create!(
  email: 'test_seeker@joblink.com', password: 'password',
  confirmed_at: Time.now
)
test_seeker.create_profile!(
  first_name: '求職者', last_name: '名無しの',
  first_name_furigana: 'きゅうしょくしゃ', last_name_furigana: 'ななしの',
  bio: '簡単ログイン中のユーザーです'
)
