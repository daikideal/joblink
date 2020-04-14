# frozen_string_literal: true

require 'rails_helper'

describe 'Registrations', type: :system do
  describe '#new' do
    context '有効な登録の場合' do
      before do
        visit new_job_offerer_registration_path
        fill_in 'メールアドレス', with: 'test@joblink.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード(確認)', with: 'password'
        click_on 'アカウント登録'
      end

      it '確認メールが送信されること' do
        expect(ActionMailer::Base.deliveries.size).to eq(1)
      end

      it 'メールアドレス認証を促すページを表示すること' do
        expect(current_path).to eq confirm_email_path
      end
    end

    context '無効な登録の場合' do
      before do
        visit new_job_offerer_registration_path
        click_on 'アカウント登録'
      end

      it '確認メールが送信されないこと' do
        expect(ActionMailer::Base.deliveries.size).to eq(0)
      end

      it 'エラーメッセージが表示されること' do
        expect(page).to have_content 'メールアドレスを入力してください'
        expect(page).to have_content 'パスワードを入力してください'
      end
    end
  end
end
