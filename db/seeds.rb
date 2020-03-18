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
  一から育てます！！圧倒的開発力をつけたいエンジニア募集
  ゼロからなにかにチャレンジしたい人歓迎！新しい働き方としてのエンジニア募集
  非常識で、世界を変えよう。エンジニアとして圧倒的に成長できる環境、あります
  学歴や経験は関係なし！誰よりも早く成長したい駆け出しエンジニアを大募集！
  生涯活かせるスキルで安定して働く。エンジニアに挑戦したい方Wanted！
  知識・実務経験０からエンジニアを目指したい人をWanted！
  成長意欲重視！本気でWebエンジニアとして成長していきたい方募集！
  キャリアチェンジも歓迎！自社Webサービスを開発したいエンジニアを募集！！
  成長中ITベンチャーで知識・経験０からエンジニアデビューしたい人を大募集！
  実務経験がゼロでも仕事を通して1からサービスを創れるエンジニアに！
]
content = [
  '社内での受託開発やお客様先でのプロジェクト開発を行なっていただきます。<br>未経験からでもWebエンジニアとして活躍できます!',
  'Webサービスやスマートフォン向けのアプリケーション開発を行います。<br>幅広い工程の開発に携わることが出来るのが特徴です。',
  'Webサイトのデザイン、フロントエンド開発、サーバーサイド開発などあなたのスキルや挑戦してみたい事に合わせた案件に携わっていただきます。',
  'まずは研修！そのあとはエンジニアとしてキャリアを積める案件に参画していただきます。',
  '現状のSI/SES業界に疑問を持っている方にお集まりいただきたいと思っています。<br>私たちは既存のものとは異なる戦略で歩んでいくことが経営方針です。',
  'Webエンジニアデビューに向けて、生涯役立つスキルや知識を身に付けられます！<br>あなたの希望に沿ったプロジェクトを見つけてきます！',
  '主にお客様先にて、バックエンドの開発・構築を行っていただきます',
  '当社では、ビジネスシーンで活用される様々な業務システム開発やインフラ構築を手掛けています。',
  'Webエンジニアを募集します！Webサービスの受託開発業務として、大手企業が実施しているアプリの機能開発、及び運営。',
  '経験をもっと積んで成長したい方大歓迎です。<br>経験は問いません！とにかく楽しく仲間で目標を持って、いきいきと仕事をしたい方は弊社に向いています！',
  '私たちはITを通して、様々なサービスを作り育てています。<br>圧倒的な技術力を使ったサービス開発とプログラミング教育で、世の中の仕組みを変えていきます。',
  '会社として様々な仕事を引き受けながら、メンバーには新しい時代に合う新しい働き方を目指してほしいと考えています。',
  '自社開発のプロジェクト管理ツールの開発や、月3本の受託システム開発を並行して担当する、エンジニアのコアメンバー候補を募集します。',
  '新規事業として、エンジニアリング事業をスタート！<br>事業会社として急成長フェーズを迎えています。',
  'WEBのシステム開発を中心に仕事をしています。<br>今後はWEBのシステム開発をベースに新しい領域にも挑戦していきます。',
  '現在は先方の会社に常駐して開発に従事しておりますが、将来的には社内での開発を強化し、自社サービスの開発も進めていきます。',
  '未経験の方OK。<br>チームメンバーがアサインされているプロジェクトに合流していただき、OJTを通じてスキルアップしていただきます。',
  'まずはこれまでの経験や学んだ分野からご担当いただき、時にはエンジニアである代表から直接レクチャーを受けながら、次第に業務の幅を広げてもらいます。',
  '知識や経験がなくてもOK！独学や実務経験なしでも大丈夫！<br>先輩や上司があなたをしっかりとサポートしますので 安心して成長できます。',
  '実務経験がなくてもOK！<br>独学や実務経験なしからでも始められるお仕事を行いながら1人前のエンジニアになれるよう実践を通じて成長していただきます。'
]
tag = [%w[Rails Ruby], %w[Python Django], %w[PHP laravel], %w[Rails Docker], %w[Ruby],
       %w[Java C#], %w[Rails Django], %w[Go AWS], %w[JavaScript], %w[WordPress],
       %w[Kubernetes], %w[Docker], %w[PHP MySQL], %w[Rails AWS], %w[Java],
       %w[Java C#], %w[Rails MySQL], %w[Go AWS], %w[Ruby Rails], %w[JavaScript]]

20.times do |n|
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

3.upto(18) do |n|
  Bookmark.create!(
    [
      { job_seeker_id: n, job_posting_id: n + 1 },
      { job_seeker_id: n, job_posting_id: n + 2 }
    ]
  )
end

25.downto(19) do |n|
  Bookmark.create!(job_seeker_id: n, job_posting_id: n - 5)
end

message_from_seeker = %w[
  はじめまして！
  お忙しいところ失礼します。
  気になったのでメッセージ送らせていただきました！
]
message_from_offerer = %w[
  プロフィールを見て、気になったのでお声かけさせていただきました！
  ご興味ありましたら返信いただけますと幸いです
  弊社で一緒に働きませんか？
]

room = Room.create!
room.entries.create!(
  job_offerer_id: 1,
  job_seeker_id: 1
)
JobOfferer.find(1).messages.create!(
  room_id: 1,
  content: 'よろしくお願いします！'
)

3.times do |n|
  room = Room.create!
  room.entries.create!(
    job_offerer_id: 3 + n,
    job_seeker_id: 1
  )
  JobOfferer.find(3 + n).messages.create!(
    room_id: 2 + n,
    content: message_from_offerer[n]
  )
end

3.times do |n|
  room = Room.create!
  room.entries.create!(
    job_offerer_id: 2,
    job_seeker_id: 2 + n
  )
  JobSeeker.find(2 + n).messages.create!(
    room_id: 5 + n,
    content: message_from_seeker[n]
  )
end