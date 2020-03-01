FactoryBot.define do
  factory :job_posting do
    association :job_offerer
    title { 'a' * 40 }
    content { '<h1>テスト</h1><div>テストデータ</div>' }

    trait :invalid do
      title { nil }
    end

    trait :another do
      title { 'b' * 40 }
      content { '<h1>テスト2</h1><div>テストデータ2</div>' }
    end
  end
end
