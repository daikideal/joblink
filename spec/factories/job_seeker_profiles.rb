FactoryBot.define do
  factory :job_seeker_profile do
    association :job_seeker
    first_name { '龍我' }
    last_name { '万丈' }
    first_name_furigana { 'りゅうが' }
    last_name_furigana { 'ばんじょう' }
    bio { 'a' * 160 }
  end
end
