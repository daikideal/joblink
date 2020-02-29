FactoryBot.define do
  factory :job_seeker_profile do
    association :job_seeker
    first_name { '龍我' }
    last_name { '万丈' }
    first_name_furigana { 'りゅうが' }
    last_name_furigana { 'ばんじょう' }
    bio { 'a' * 160 }

    trait :invalid do
      first_name { nil }
    end

    trait :another do
      first_name { '一海' }
      last_name { '猿渡' }
      first_name_furigana { 'かずみ' }
      last_name_furigana { 'さわたり' }
      bio { 'b' * 160 }
    end
  end
end
