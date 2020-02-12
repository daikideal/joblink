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
tag = [%w[Rails Ruby], %w[Python Django], %w[PHP laravel],
       %w[Rails Docker], %w[フリーランス], %w[Java C#], %w[Rails Django],
       %w[Go AWS], %w[Azure], %w[WordPress]]
10.times do |n|
  posting = JobPosting.create!(
    job_offerer_id: n + 3,
    title: title[n],
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
