# frozen_string_literal: true

FactoryBot.define do
  factory :entry do
    association :room
    association :job_offerer
    association :job_seeker
  end
end
