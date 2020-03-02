FactoryBot.define do
  factory :resume do
    association :job_seeker
    content { '<h1>テスト</h1><div>テストデータ</div>' }
  end
end
