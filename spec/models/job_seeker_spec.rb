require 'rails_helper'

RSpec.describe JobSeeker, type: :model do
  describe 'バリデーション' do
    let(:job_seeker) { build(:job_seeker) }

    it 'メールアドレスとパスワードがあれば有効であること' do
      expect(job_seeker).to be_valid
    end

    it 'メールアドレスがなければ無効であること' do
      job_seeker.email = ''
      expect(job_seeker).to_not be_valid
    end

    it 'メールアドレスが重複していると無効であること' do
      job_seeker.save
      expect(build(:job_seeker, email: job_seeker.email)).to_not be_valid
    end

    it 'メールアドレスが認証されていなければ無効であること' do
      job_seeker.email = ''
      job_seeker.unconfirmed_email = 'test@joblink.com'
      expect(job_seeker).to_not be_valid
    end

    it 'パスワードがなければ無効であること' do
      job_seeker.password = ''
      expect(job_seeker).to_not be_valid
    end

    it 'パスワードが6文字以上でなければ無効であること' do
      job_seeker.password = 'a' * 5
      expect(job_seeker).to_not be_valid
    end

    it 'パスワードが128文字以内でなければ無効であること' do
      job_seeker.password = 'a' * 129
      expect(job_seeker).to_not be_valid
    end

    it 'パスワードが暗号化されていること' do
      job_seeker.save
      expect(job_seeker.encrypted_password).to_not eq 'password'
    end
  end
end
