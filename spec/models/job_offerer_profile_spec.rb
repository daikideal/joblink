require 'rails_helper'

RSpec.describe JobOffererProfile, type: :model do
  describe 'バリデーション' do
    it '姓, 名, 姓(ふりがな), 名(ふりがな)があれば有効であること' do
      expect(build(:job_offerer_profile)).to be_valid
    end

    it '姓がなければ無効であること' do
      expect(build(:job_offerer_profile, last_name: '')).to_not be_valid
    end

    it '名がなければ無効であること' do
      expect(build(:job_offerer_profile, first_name: '')).to_not be_valid
    end

    it '姓(ふりがな)がなければ無効であること' do
      expect(
        build(:job_offerer_profile, last_name_furigana: '')
      ).to_not be_valid
    end

    it '名(ふりがな)がなければ無効であること' do
      expect(
        build(:job_offerer_profile, first_name_furigana: '')
      ).to_not be_valid
    end

    it 'bioは160文字以内であること' do
      expect(build(:job_offerer_profile, bio: 'a' * 161)).to_not be_valid
    end
  end

  describe 'アバター' do
    let(:profile) { create(:job_offerer_profile) }

    it 'アバター画像を追加できること' do
      profile.avatar.attach(
        io: File.open('spec/factories/test.jpg'), filename: 'test.jpg'
      )
      expect(profile).to be_valid
    end
  end

  describe 'フルネーム' do
    let(:profile) { create(:job_offerer_profile) }

    it '姓と名をつなげたフルネームを返すこと' do
      full_name = profile.last_name + ' ' + profile.first_name
      expect(profile.full_name).to eq(full_name)
    end

    it '姓(ふりがな)と名(ふりがな)をつなげたフルネーム(ふりがな)を返すこと' do
      full_name_furigana =
        profile.last_name_furigana + ' ' + profile.first_name_furigana
      expect(profile.full_name_furigana).to eq(full_name_furigana)
    end
  end
end
