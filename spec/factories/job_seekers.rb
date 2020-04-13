# frozen_string_literal: true

FactoryBot.define do
  factory :job_seeker do
    sequence(:email) { |n| "test#{n}@joblink.com" }
    password { 'password' }
    confirmed_at { Time.now }

    trait :unconfirmed do
      email { '' }
      unconfirmed_email { 'unconfirmed@joblink.com' }
      password { 'password' }
    end
  end
end
