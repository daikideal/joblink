# frozen_string_literal: true

test_seeker = JobSeeker.create!(
  email: 'test_seeker@joblink.com', password: 'password',
  confirmed_at: Time.now
)
test_seeker.create_profile!(
  first_name: '求職者', last_name: '名無しの',
  first_name_furigana: 'きゅうしょくしゃ', last_name_furigana: 'ななしの',
  bio: '簡単ログイン中のユーザーです'
)
test_seeker.profile.avatar.attach(
  io: File.open('db/sample/avatar/guest_seeker.jpeg'),
  filename: 'guest_seeker.jpeg'
)
