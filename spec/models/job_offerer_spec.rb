require 'rails_helper'

RSpec.describe JobOfferer, type: :model do
  describe 'バリデーション' do
    let(:job_offerer) { build(:job_offerer) }

    it 'メールアドレスとパスワードがあれば有効であること' do
      expect(job_offerer).to be_valid
    end

    it 'メールアドレスがなければ無効であること' do
      job_offerer.email = ''
      expect(job_offerer).to_not be_valid
    end

    it 'メールアドレスが重複していると無効であること' do
      job_offerer.save
      expect(build(:job_offerer, email: job_offerer.email)).to_not be_valid
    end

    it 'メールアドレスが認証されていなければ無効であること' do
      job_offerer.email = ''
      job_offerer.unconfirmed_email = 'test@joblink.com'
      expect(job_offerer).to_not be_valid
    end

    it 'パスワードがなければ無効であること' do
      job_offerer.password = ''
      expect(job_offerer).to_not be_valid
    end

    it 'パスワードが6文字以上でなければ無効であること' do
      job_offerer.password = 'a' * 5
      expect(job_offerer).to_not be_valid
    end

    it 'パスワードが128文字以内でなければ無効であること' do
      job_offerer.password = 'a' * 129
      expect(job_offerer).to_not be_valid
    end

    it 'パスワードが暗号化されていること' do
      job_offerer.save
      expect(job_offerer.encrypted_password).to_not eq 'password'
    end
  end
end
