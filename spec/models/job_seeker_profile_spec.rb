require 'rails_helper'

RSpec.describe JobSeekerProfile, type: :model do
  let(:profile) { create(:job_seeker_profile) }

  describe 'バリデーション' do
    it '姓, 名, 姓(ふりがな), 名(ふりがな)があれば有効であること' do
      expect(profile).to be_valid
    end

    it '姓がなければ無効であること' do
      profile.last_name = ''
      expect(profile).to_not be_valid
    end

    it '名がなければ無効であること' do
      profile.first_name = ''
      expect(profile).to_not be_valid
    end

    it '姓(ふりがな)がなければ無効であること' do
      profile.last_name_furigana = ''
      expect(profile).to_not be_valid
    end

    it '名(ふりがな)がなければ無効であること' do
      profile.first_name_furigana = ''
      expect(profile).to_not be_valid
    end

    it 'bioは160文字以内であること' do
      profile.bio = 'a' * 161
      expect(profile).to_not be_valid
    end

    it 'アバター画像を追加できること' do
      profile.avatar.attach(
        io: File.open('spec/factories/test.jpg'), filename: 'test.jpg'
      )
      expect(profile).to be_valid
    end
  end

  describe 'フルネーム' do
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
