FactoryBot.define do
  factory :job_seeker do
    sequence(:email) { |n| "test#{n}@joblink.com" }
    password { 'password' }
    confirmed_at { Time.now }

    trait :unconfirmed_job_seeker do
      email { 'unconfirmed@joblink.com' }
      password { 'password' }
      confirmed_at { nil }
    end
  end
end
