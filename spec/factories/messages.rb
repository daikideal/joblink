# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    association :room
    content { 'テストデータ' }
  end
end
