# frozen_string_literal: true

Dir.glob(File.join(Rails.root, 'db', 'seeds', '*.rb')) do |file|
  load(file)
end

title = %w[
  微経験歓迎！ゼロから始めるWebエンジニアになりたい方募集！
  自由にやりたい事を仕事にしたい開発エンジニアを探しています！
  急成長ITベンチャーで仲間と共に成長がしたいエンジニアを大募集！
  一緒に会社を作っていきませんか？グロースメンバー募集！！
  選べるキャリア、なりたいキャリア。まずは当社で話を聞きませんか？
  自由な働き方を実現！０からモダンなエンジニアに育てます！
  ポテンシャル重視！ハイエンドなバックエンドエンジニアになりたい方募集！
  エンジニアのために！を実現する会社でシステム部メンバー募集。
  無限に学び、新しい価値観の世代を創造する！開発を担うWebエンジニア募集！
  未経験でも大丈夫！自由で楽しいことが大好きな人、ものづくりが大好きな人来たれ！
]
content = [
  '社内での受託開発やお客様先でのプロジェクト開発を行なっていただきます。<br>未経験からでもWebエンジニアとして活躍できます!',
  'Webサービスやスマートフォン向けのアプリケーション開発を行います。<br>幅広い工程の開発に携わることが出来るのが特徴です。',
  'Webサイトのデザイン、フロントエンド開発、サーバーサイド開発などあなたのスキルや挑戦してみたい事に合わせた案件に携わっていただきます。',
  'まずは研修！そのあとはエンジニアとしてキャリアを積める案件に参画していただきます。',
  '現状のSI/SES業界に疑問を持っている方にお集まりいただきたいと思っています。<br>私たちは既存ものとは異なる戦略で歩んでいくことが経営方針です。',
  'Webエンジニアデビューに向けて、生涯役立つスキルや知識を身に付けられます！<br>あなたの希望に沿ったプロジェクトを見つけてきます！',
  '主にお客様先にて、バックエンドの開発・構築を行っていただきます',
  '当社では、ビジネスシーンで活用される様々な業務システム開発やインフラ構築を手掛けています。',
  'Webエンジニアを募集します！Webサービスの受託開発業務として、大手企業が実施しているアプリの機能開発、及び運営。',
  '経験をもっと積んで成長したい方大歓迎です。<br>経験は問いません！とにかく楽しく仲間で目標を持って、いきいきと仕事をしたい方は弊社に向いています！'
]
tag = [%w[Rails Ruby], %w[Python Django], %w[PHP laravel],
       %w[Rails Docker], %w[フリーランス], %w[Java C#], %w[Rails Django],
       %w[Go AWS], %w[Azure], %w[WordPress]]
10.times do |n|
  posting = JobPosting.create!(
    job_offerer_id: n + 3,
    title: title[n],
    content: "<h1>こんなことをやっています</h1><div>#{content[n]}</div>",
    tag_list: tag[n]
  )
  posting.header.attach(
    io: File.open("db/sample/header/header_#{n + 1}.jpg"), filename: "header_#{n + 1}.jpg"
  )
end

3.upto(8) do |n|
  Bookmark.create!(
    [
      { job_seeker_id: n, job_posting_id: n + 1 },
      { job_seeker_id: n, job_posting_id: n + 2 }
    ]
  )
end

15.downto(9) do |n|
  Bookmark.create!(job_seeker_id: n, job_posting_id: n - 5)
end
