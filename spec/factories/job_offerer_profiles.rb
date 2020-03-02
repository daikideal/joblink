FactoryBot.define do
  factory :job_offerer_profile do
    association :job_offerer
    first_name { '戦兎' }
    last_name { '桐生' }
    first_name_furigana { 'せんと' }
    last_name_furigana { 'きりゅう' }
    bio { 'a' * 160 }

    trait :invalid do
      first_name { nil }
    end

    trait :another do
      first_name { '巧' }
      last_name { '葛木' }
      first_name_furigana { 'たくみ' }
      last_name_furigana { 'かつらぎ' }
      bio { 'b' * 160 }
    end
  end
end
