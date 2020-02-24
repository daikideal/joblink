require 'rails_helper'

RSpec.describe JobOfferer, type: :model do
  it 'メールアドレスとパスワードがあれば有効であること' do
    expect(FactoryBot.create(:job_offerer)).to be_valid
  end

  it 'メールアドレスがなければ無効であること' do
    expect(FactoryBot.build(:job_offerer, email: '')).to_not be_valid
  end

  it 'メールアドレスが重複していると無効であること' do
    job_offerer = FactoryBot.create(:job_offerer, email: 'test@joblink.com')
    expect(
      FactoryBot.build(:job_offerer, email: job_offerer.email)
    ).to_not be_valid
  end

  it 'メールアドレスが認証されていなければ無効であること' do
    expect(
      FactoryBot.build(
        :job_offerer, email: '', unconfirmed_email: 'test@joblink.com'
      )
    ).to_not be_valid
  end

  it 'パスワードがなければ無効であること' do
    expect(FactoryBot.build(:job_offerer, password: '')).to_not be_valid
  end

  it 'パスワードが6文字以上でなければ無効であること' do
    expect(FactoryBot.build(:job_offerer, password: 'a' * 5)).to_not be_valid
  end

  it 'パスワードが128文字以内でなければ無効であること' do
    expect(FactoryBot.build(:job_offerer, password: 'a' * 129)).to_not be_valid
  end

  it 'パスワードが暗号化されていること' do
    job_offerer = FactoryBot.create(:job_offerer)
    expect(job_offerer.encrypted_password).to_not eq 'password'
  end
end
