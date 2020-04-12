# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resume, type: :model do
  describe 'バリデーション' do
    it '本文があれば有効であること' do
      expect(build(:resume)).to be_valid
    end

    it '本文がなければ無効であること' do
      expect(build(:resume, content: nil)).to_not be_valid
    end
  end
end
