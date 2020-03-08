require 'rails_helper'

describe 'Chat', type: :system do
  let(:job_offerer_profile) { create(:job_offerer_profile) }
  let(:job_seeker_profile) { create(:job_seeker_profile) }
  let(:job_offerer) { job_offerer_profile.job_offerer }
  let(:job_seeker) { job_seeker_profile.job_seeker }

  shared_context '求人者でログイン' do
    before do
      visit new_job_offerer_session_path
      fill_in 'メールアドレス', with: job_offerer.email
      fill_in 'パスワード', with: job_offerer.password
      click_on 'ログイン'
    end
  end

  shared_context '求職者でログイン' do
    before do
      visit new_job_seeker_session_path
      fill_in 'メールアドレス', with: job_seeker.email
      fill_in 'パスワード', with: job_seeker.password
      click_on 'ログイン'
    end
  end

  shared_context 'トークルームが存在' do
    let(:room) { Room.create }
    before do
      room.entries.create(
        job_offerer_id: job_offerer.id,
        job_seeker_id: job_seeker.id
      )
    end
  end

  describe 'トークルーム入室' do
    context '求人者でログインしている場合' do
      include_context '求人者でログイン'

      it '求人者が入室できること' do
        visit job_seeker_path(job_seeker)
        click_on 'メッセージ'
        expect(current_path).to eq room_path(Room.last)
      end
    end

    context '求職者でログインしている場合' do
      include_context '求職者でログイン'

      it '求職者が入室できること' do
        visit job_offerer_path(job_offerer)
        click_on 'メッセージ'
        expect(current_path).to eq room_path(Room.last)
      end
    end
  end

  describe 'メッセージ送信' do
    include_context 'トークルームが存在'

    context '求人者でログインしている場合' do
      include_context '求人者でログイン'

      it 'メッセージを送信できること' do
        visit room_path(room)
        expect(page).to have_content('送信')
        # fill_in 'メッセージ', with: 'テスト'
        # click_on '送信'
        # sleep 0.5
        # expect(room.messages.last.content).to eq 'テスト'
      end
    end

    context '求職者でログインしている場合' do
      include_context '求職者でログイン'

      it 'メッセージを送信できること' do
        visit room_path(room)
        expect(page).to have_content('送信')
        # fill_in 'メッセージ', with: 'test'
        # click_on '送信'
        # sleep 0.5
        # expect(room.messages.last.content).to eq 'test'
      end
    end
  end

  describe 'トークルーム退出' do
    include_context 'トークルームが存在'

    context '求人者でログインしている場合' do
      include_context '求人者でログイン'

      before do
        visit room_path(room)
        click_on 'exit_to_app'
        page.driver.browser.switch_to.alert.accept
        sleep 0.5
      end

      it '入室権限がなくなること' do
        expect(Entry.find_by(room_id: room.id).job_offerer_id)
          .to eq nil
      end

      it 'トークルーム一覧にリダイレクトされること' do
        expect(current_path).to eq rooms_path
      end
    end

    context '求職者でログインしている場合' do
      include_context '求職者でログイン'

      before do
        visit room_path(room)
        click_on 'exit_to_app'
        page.driver.browser.switch_to.alert.accept
        sleep 0.5
      end

      it '入室権限がなくなること' do
        expect(Entry.find_by(room_id: room.id).job_seeker_id)
          .to eq nil
      end

      it 'トークルーム一覧にリダイレクトされること' do
        expect(current_path).to eq rooms_path
      end
    end
  end
end
