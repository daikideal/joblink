require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'バリデーション' do
    it '本文が入力されていれば有効であること' do
      expect(build(:message)).to be_valid
    end

    it '本文が入力されていなければ無効であること' do
      expect(build(:message, content: '')).to_not be_valid
    end
  end
end
