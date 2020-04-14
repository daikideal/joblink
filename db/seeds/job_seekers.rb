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

first_name = %i[冬馬 北斗 翔太 恋鐘 摩美々
                結華 咲耶 霧子 隼人 旬
                夏来 春名 四季 圭 麗
                朱雀 玄武 巻緒 咲 はづき
                タケル 漣 涼 大吾 一希
                忍 穂乃香 あずき 柚 智香]
last_name = %i[天ヶ瀬 伊集院 御手洗 月岡
               田中 三峰 白瀬 幽谷 秋山
               冬美 榊 若里 伊勢谷 都築 神楽
               紅井 黒野 卯月 水嶋 七草
               大河 牙崎 秋月 兜 九十九
               工藤 綾瀬 桃井 喜多見 若林]
first_name_furigana = %i[とうま ほくと しょうた こがね まみみ
                         ゆいか さくや きりこ はやと じゅん
                         なつき はるな しき けい れい
                         すざく げんぶ まきお さき はづき
                         たける れん りょう だいご かずき
                         しのぶ ほのか あずき ゆず ともか]
last_name_furigana = %i[あまがせ いじゅういん みてらい つきおか たなか
                        みつみね しらせ ゆうこく あきやま とうみ
                        さかき わかざと いせや つづき かぐら
                        あかい くろの うづき みずしま ななくさ
                        たいが きざき あきづき かぶと つくも
                        くどう あやせ ももい きたみ わかばやし]
bio = ['がんばります！', 'モチベーションを常に高く。',
       '継続は力なり', '考える前にやってみる！',
       'よろしくお願いします！！', '好きを仕事にするのが夢です。',
       '過去ばかり振り向いているのではダメだ。', '未経験でも、学ぶ姿勢なら負けません！',
       '前進し続けられたのは、自分がやることを愛していたからだ。', '大切なのは明日何が起きるか',
       '何かを捨てないと前に進めない。', '毎日前進',
       'Apple製品が好き', 'なんでもやります！！',
       '駆け出しですが、頑張ります！', '成功はシェアした時に最高のものになる',
       '成長と快適さは共存できない', 'リスクを取らないことが最大のリスク',
       'チャンスは常に人々の不満の中にある', 'できるまで遠くへ行こう',
       '身を粉にするな、頭を粉にせよ', '明確な目標を定めた後は、執念',
       '運に恵まれるには、努力が必要', '後悔するとしたら、挑戦しなかった時だろう',
       '夢を追いかける勇気があれば、すべては現実になる', 'あらゆる事象は心の反映である',
       '考える前に飛べ', '難しいのは「しないこと」を決めること',
       '上手くいくとわかっているのであれば、実験とは呼ばない', '何度も死にかけて、頑張っています。']
tag = [%w[Rails Ruby], %w[Python Django], %w[AWS], %w[Azure], %w[PHP laravel],
       %w[経理 人事], %w[営業], %w[人事], %w[Rails 実務未経験], %w[フリーランス],
       %w[Ruby], %w[Rails JavaScript], %w[Go AWS], %w[AWS GCP], %w[PHP Ruby],
       %w[C# Azure], %w[Rails AWS], %w[DevOps], %w[Ruby], %w[Rails MySQL],
       %w[Kubernetes], %w[Docker], %w[PHP MySQL], %w[Rails AWS], %w[Java],
       %w[GCP Go], %w[AWS], %w[Python Django], %w[Swift], %w[実務未経験]]
content = [
  '<h1>希望職種</h1><div>自分がこれまで培ってきたスキルを活かすことができるやりがいのあるポジション</div>',
  '<h1>経歴・スキルの要約</h1><div>3年間のweb開発経験</div>',
  '<h1>職歴</h1><div>ABCインターナショナル 2015.5 ~ 現在</div>',
  '<h1>学歴</h1><div>東京大学 工学部</div>',
  '<h1>資格・スキル</h1><div>TOEIC 850 (2019)</div>',
  '<h1>その他特筆事項</h1><div>南アメリカでのボランティア活動</div>',
  '<h1>希望職種</h1><div>新規の事業やプロジェクトの中核をになっていくポジション</div>',
  '<h1>経歴・スキルの要約</h1><div>自社プロダクトのマーケティングを2年間</div>',
  '<h1>職歴</h1><div>DDDシステムズ株式会社 2012.4 ~ 現在</div>',
  '<h1>学歴</h1><div>早稲田大学 法学部</div>',
  '<h1>資格・スキル</h1><div>基本情報技術者 (2018)</div>',
  '<h1>その他特筆事項</h1><div>地域のスポーツ活動</div>',
  '<h1>希望職種</h1><div>あるものを改善したり強みをさらに伸ばす仕事</div>',
  '<h1>経歴・スキルの要約</h1><div>6年間のシステムアーキテクト</div>',
  '<h1>職歴</h1><div>株式会社X 2018.4 ~ 現在</div>',
  '<h1>希望職種</h1><div>自分がこれまで培ってきたスキルを活かすことができるやりがいのあるポジション</div>',
  '<h1>経歴・スキルの要約</h1><div>5年間のweb開発経験</div>',
  '<h1>職歴</h1><div>DEFインターナショナル 2017.4 ~ 現在</div>',
  '<h1>学歴</h1><div>東京大学 法学部</div>',
  '<h1>資格・スキル</h1><div>TOEIC 800 (2019)</div>',
  '<h1>その他特筆事項</h1><div>アフリカでのボランティア活動</div>',
  '<h1>希望職種</h1><div>新規の事業やプロジェクトの中核をになっていくポジション</div>',
  '<h1>経歴・スキルの要約</h1><div>自社プロダクトのマーケティングを4年間</div>',
  '<h1>職歴</h1><div>CCCシステムズ株式会社 2012.4 ~ 現在</div>',
  '<h1>学歴</h1><div>早稲田大学 理工学部</div>',
  '<h1>資格・スキル</h1><div>応用情報技術者 (2019)</div>',
  '<h1>その他特筆事項</h1><div>地域のスポーツ活動運営</div>',
  '<h1>希望職種</h1><div>あるものを改善したり強みをさらに伸ばす仕事</div>',
  '<h1>経歴・スキルの要約</h1><div>6年間のシステムアーキテクト</div>',
  '<h1>職歴</h1><div>株式会社Y 2015.3 ~ 現在</div>'
]

30.times do |n|
  user = JobSeeker.create!(
    email: "job_seeker#{n + 1}@joblink.com", password: 'password',
    confirmed_at: Time.now
  )
  profile = user.create_profile!(
    first_name: first_name[n], last_name: last_name[n],
    first_name_furigana: first_name_furigana[n],
    last_name_furigana: last_name_furigana[n],
    bio: bio[n], tag_list: tag[n]
  )
  profile.avatar.attach(
    io: File.open("db/sample/avatar/seeker_#{n + 1}.jpeg"),
    filename: "seeker_#{n + 1}.jpeg"
  )
  user.create_resume!(content: content[n])
end
