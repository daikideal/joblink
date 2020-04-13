# frozen_string_literal: true

require 'rails_helper'

describe 'Bookmark', type: :system do
  let(:job_offerer_profile) { create(:job_offerer_profile) }
  let(:job_seeker_profile) { create(:job_seeker_profile) }
  let(:job_offerer) { job_offerer_profile.job_offerer }
  let(:job_seeker) { job_seeker_profile.job_seeker }
  let(:post) { create(:job_posting, job_offerer_id: job_offerer.id) }

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

  describe 'ブックマーク' do
    context 'ログインしていない場合' do
      it 'ブックマークボタンを表示すること' do
        visit job_posting_path(post)
        expect(page).to have_content('bookmark_border')
        expect(page).to have_link("bookmark_button_#{post.id}")
      end

      it 'クリックすると求人者でのログインを要求されること' do
        visit job_posting_path(post)
        click_on "bookmark_button_#{post.id}"
        expect(current_path).to eq new_job_seeker_session_path
      end
    end

    context '求人者でログインしている場合' do
      include_context '求人者でログイン'

      it 'ブックマーク不可能なアイコンを表示すること' do
        visit job_posting_path(post)
        expect(page).to have_content('bookmark_border')
      end
    end

    context '求職者でログインしている場合' do
      include_context '求職者でログイン'

      it 'ブックマークボタンを表示すること' do
        visit job_posting_path(post)
        expect(page).to have_content('bookmark_border')
        expect(page).to have_link("bookmark_button_#{post.id}")
      end

      it 'クリックするとその求人をブックマークすること' do
        visit job_posting_path(post)
        click_on "bookmark_button_#{post.id}"
        sleep 0.5
        expect(Bookmark.last.job_posting_id).to eq post.id
        expect(Bookmark.last.job_seeker_id).to eq job_seeker.id
      end

      it 'ブックマーク解除ボタンを表示すること' do
        visit job_posting_path(post)
        click_on "bookmark_button_#{post.id}"
        sleep 0.5
        expect(page).to have_content('bookmark')
        expect(page).to have_link("bookmark_button_#{post.id}")
      end
    end
  end

  describe 'ブックマーク解除' do
    context '求職者でログインしている場合' do
      include_context '求職者でログイン'

      before do
        job_seeker.bookmarks.create(job_posting_id: post.id)
      end

      it 'ブックマーク解除ボタンを表示すること' do
        visit job_posting_path(post)
        expect(page).to have_content('bookmark')
        expect(page).to have_link("bookmark_button_#{post.id}")
      end

      it 'クリックするとその求人のブックマークを解除すること' do
        visit job_posting_path(post)
        click_on "bookmark_button_#{post.id}"
        sleep 0.5
        expect(job_seeker.bookmarks.last).to eq nil
      end

      it 'ブックマークボタンを表示すること' do
        visit job_posting_path(post)
        click_on "bookmark_button_#{post.id}"
        sleep 0.5
        expect(page).to have_content('bookmark_border')
        expect(page).to have_link("bookmark_button_#{post.id}")
      end
    end
  end
end
