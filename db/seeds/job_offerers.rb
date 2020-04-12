# frozen_string_literal: true

admin = JobOfferer.create!(
  email: ENV['ADMIN_EMAIL'], password: ENV['ADMIN_PASSWORD'],
  confirmed_at: Time.now, admin: true
)
admin.create_profile!(
  first_name: ENV['ADMIN_FIRST_NAME'], last_name: ENV['ADMIN_LAST_NAME'],
  first_name_furigana: ENV['ADMIN_FIRST_NAME_FURIGANA'],
  last_name_furigana: ENV['ADMIN_LAST_NAME_FURIGANA'],
  bio: 'Welcome to JOBLINK!', tag_list: ['web系']
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

first_name = %i[輝 薫 翼 雨彦 想楽
                クリス 美優 楓 瑞樹 心
                菜々 道夫 類 次郎 賢
                英雄 龍 誠司 瞳子 留美
                幸広 壮一郎 道流 礼子 つかさ
                恭二 みのり 孝司 努 崇男]
last_name = %i[天道 桜庭 柏木 葛之葉 北村
               古論 三船 高垣 川島 佐藤
               安部 硲 舞田 山下 山村
               握野 木村 信玄 服部 和久井
               神谷 東雲 円城寺 高橋 桐生
               鷹城 渡辺 齋藤 天井 黒井]
first_name_furigana = %i[てる かおる つばさ あめひこ そら
                         クリス みゆ かえで みずき しん
                         なな みちお るい じろう けん
                         ひでお りゅう せいじ とうこ るみ
                         ゆきひろ そういちろう みちる れいこ つかさ
                         きょうじ みのり こうじ つとむ たかお]
last_name_furigana = %i[てんどう さくらば かしわぎ くずのは きたむら
                        ころん みふね たかがき かわしま さとう
                        あべ はざま まいた やました やまむら
                        あくの きむら しんげん はっとり わくい
                        かみや しののめ えんじょうじ たかはし きりゅう
                        たかじょう わたなべ さいとう あまい くろい]
bio = ['皆さんが好きなことを仕事にし楽しく働けますように', 'お気軽にどうぞ！',
       '2020年のテーマは"貢献"', 'モットーは直感を信じ本質を追求する',
       '一緒に頑張りましょう！', '夜眠るとき、我々は素晴らしいことをしたと言えること、それが重要だ。',
       '過去ばかり振り向いているのではダメだ。', '動機こそが大切だ',
       '一つのことを、一生やり続けられると確信する日がくる', 'キャリアではない。私の人生なんだ。',
       '旅の過程にこそ価値がある。', 'DMはお気軽に！',
       '楽しく働く', '好きを仕事に', 
       '歩き続けよう', '続けることが力になる',
       '夢中になれることを見つけよう', '困難に直面した時、勇気が必要な道を選ぶように',
       '時には、世間の常識に反することを行う必要がある', '会社は働く人のためにあるものだ',
       'ただの会社を作るのではなく世界を変える変化を起こしたい', '重要なのは、一歩一歩、着実に進むこと',
       '自分自身であり続けること', 'いつも全速力で限界を越えようとしている',
       'チームは、一丸となった時に成功する', '革新的なことをする時は、他人から馬鹿にされる覚悟が必要',
       '失敗については心配しないこと。', 'お金ではなく、ビジョンを追いかけましょう。',
       '自分ができる最も重要なことをやっているだろうか？', '必要なのは、フレームワークと夢だけ']
tag = [%w[法務], %w[Python Django], %w[AWS], %w[AWS GCP Azure], %w[PHP laravel],
       %w[Rails Ruby], %w[メーカー 生産管理], %w[総務 人事], %w[Rails Docker CircleCI], %w[フリーランス],
       %w[Java C#], %w[Rails Django], %w[Go AWS], %w[Azure], %w[WordPress],
       %w[Kubernetes], %w[Docker], %w[PHP MySQL], %w[Rails AWS], %w[Java],
       %w[GCP Go], %w[AWS], %w[Python Django], %w[Swift], %w[メーカー 人事],
       %w[C# Azure], %w[Rails AWS], %w[Scala], %w[総務], %w[法務]]

30.times do |n|
  user = JobOfferer.create!(
    email: "job_offerer#{n + 1}@joblink.com", password: 'password',
    confirmed_at: Time.now
  )
  profile = user.create_profile!(
    first_name: first_name[n], last_name: last_name[n],
    first_name_furigana: first_name_furigana[n],
    last_name_furigana: last_name_furigana[n],
    bio: bio[n], tag_list: tag[n]
  )
  profile.avatar.attach(
    io: File.open("db/sample/avatar/offerer_#{n + 1}.jpeg"),
    filename: "offerer_#{n + 1}.jpeg"
  )
end
