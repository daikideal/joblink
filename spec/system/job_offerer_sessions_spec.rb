require 'rails_helper'

describe 'Sessions', type: :system do
  describe '#new' do
    before do
      create(:job_offerer, email: 'test@joblink.com')
    end

    context '有効なログインの場合' do
      before do
        visit new_job_offerer_session_path
        fill_in 'メールアドレス', with: 'test@joblink.com'
        fill_in 'パスワード', with: 'password'
        click_on 'ログイン'
      end

      it 'homeにリダイレクトされること' do
        expect(current_path). to eq root_path
      end

      it 'ログイン成功のメッセージが表示されること' do
        expect(page).to have_content 'ログインしました。'
      end
    end

    context '無効なログインの場合' do
      before do
        visit new_job_offerer_session_path
        click_on 'ログイン'
      end

      it '画面遷移しないこと' do
        expect(current_path). to eq new_job_offerer_session_path
      end

      it 'ログイン失敗のメッセージが表示されること' do
        expect(page).to have_content 'メールアドレスまたはパスワードが違います。'
      end
    end
  end
end
