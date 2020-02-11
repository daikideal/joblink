# frozen_string_literal: true

guest = JobSeeker.create!(
  email: 'test_seeker@joblink.com', password: 'password',
  confirmed_at: Time.now
)
guest.create_profile!(
  first_name: '求職者', last_name: '名無しの',
  first_name_furigana: 'きゅうしょくしゃ', last_name_furigana: 'ななしの',
  bio: '簡単ログイン中のユーザーです'
)
guest.profile.avatar.attach(
  io: File.open('db/sample/avatar/guest_seeker.jpeg'),
  filename: 'guest_seeker.jpeg'
)

first_name = %i[冬馬 北斗 翔太 恋鐘 摩美々 結華 咲耶 霧子 隼人 旬 夏来 春名 四季 圭 麗]
last_name = %i[天ヶ瀬 伊集院 御手洗 月岡 田中 三峰 白瀬 幽谷 秋山 冬美 榊 若里 伊勢谷 都築 神楽]
first_name_furigana = %i[とうま ほくと しょうた こがね まみみ ゆいか さくや ゆうこく はやと じゅん なつき はるな しき けい れい]
last_name_furigana = %i[あまがせ いじゅういん みてらい つきおか たなか みつみね しらせ きりこ あきやま とうみ さかき わかざと いせや つづき かぐら]

15.times do |n|
  user = JobSeeker.create!(
    email: "job_seeker#{n + 1}@joblink.com", password: 'password',
    confirmed_at: Time.now
  )
  profile = user.create_profile!(
    first_name: first_name[n], last_name: last_name[n],
    first_name_furigana: first_name_furigana[n],
    last_name_furigana: last_name_furigana[n]
  )
  profile.avatar.attach(
    io: File.open("db/sample/avatar/seeker_#{n + 1}.jpeg"),
    filename: "seeker_#{n + 1}.jpeg"
  )
end
