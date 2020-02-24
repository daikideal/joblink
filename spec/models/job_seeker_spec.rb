require 'rails_helper'

RSpec.describe JobSeeker, type: :model do
  describe 'バリデーション' do
    it 'メールアドレスとパスワードがあれば有効であること' do
      expect(create(:job_seeker)).to be_valid
    end

    it 'メールアドレスがなければ無効であること' do
      expect(build(:job_seeker, email: '')).to_not be_valid
    end

    it 'メールアドレスが重複していると無効であること' do
      job_seeker = create(:job_seeker, email: 'test@joblink.com')
      expect(
        build(:job_seeker, email: job_seeker.email)
      ).to_not be_valid
    end

    it 'メールアドレスが認証されていなければ無効であること' do
      expect(
        build(
          :job_seeker, email: '', unconfirmed_email: 'test@joblink.com'
        )
      ).to_not be_valid
    end

    it 'パスワードがなければ無効であること' do
      expect(build(:job_seeker, password: '')).to_not be_valid
    end

    it 'パスワードが6文字以上でなければ無効であること' do
      expect(build(:job_seeker, password: 'a' * 5)).to_not be_valid
    end

    it 'パスワードが128文字以内でなければ無効であること' do
      expect(build(:job_seeker, password: 'a' * 129)).to_not be_valid
    end

    it 'パスワードが暗号化されていること' do
      job_seeker = create(:job_seeker)
      expect(job_seeker.encrypted_password).to_not eq 'password'
    end
  end
end
