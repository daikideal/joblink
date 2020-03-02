require 'rails_helper'

RSpec.describe JobPosting, type: :model do
  let(:job_posting) { create(:job_posting) }

  describe 'バリデーション' do
    it 'タイトルと本文があれば有効であること' do
      expect(job_posting).to be_valid
    end

    it 'タイトルがなければ無効であること' do
      job_posting.title = ''
      expect(job_posting).to_not be_valid
    end

    it 'タイトルは40文字以内であること' do
      job_posting.title = 'a' * 41
      expect(job_posting).to_not be_valid
    end

    it '本文がなければ無効であること' do
      job_posting.content = nil
      expect(job_posting).to_not be_valid
    end

    it 'ヘッダー画像を追加できること' do
      job_posting.header.attach(
        io: File.open('spec/factories/test.jpg'), filename: 'test.jpg'
      )
      expect(job_posting).to be_valid
    end
  end
end
