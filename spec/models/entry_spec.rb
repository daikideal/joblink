# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Entry, type: :model do
  let(:entry) { create(:entry) }

  describe 'バリデーション' do
    it '有効な入室権限が作成できること' do
      expect(build(:entry)).to be_valid
    end

    it '求人者が退出しても求職者の入室権限が有効であること' do
      entry.job_offerer = nil
      expect(entry).to be_valid
    end

    it '求職者が退出しても求人者の入室権限が有効であること' do
      entry.job_seeker = nil
      expect(entry).to be_valid
    end
  end
end
