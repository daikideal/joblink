FactoryBot.define do
  factory :message do
    association :room
    content { 'テストデータ' }
  end
end
