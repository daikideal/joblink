FactoryBot.define do
  factory :job_posting do
    association :job_offerer
    title { 'a' * 40 }
    content { '<h1>テスト</h1><div>テストデータ</div>' }
  end
end
