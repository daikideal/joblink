require 'rails_helper'

RSpec.describe JobPostingsController, type: :request do
  describe 'GET #index' do
    before do
      create(:job_posting)
      create(:job_posting, :another)
    end

    it 'リクエストが成功すること' do
      get job_postings_path
      expect(response.status).to eq 200
    end

    it '求人情報が表示されていること' do
      get job_postings_path
      expect(response.body).to include('a' * 40)
      expect(response.body).to include('b' * 40)
    end
  end

  describe 'GET #show' do
    let(:post) { create(:job_posting) }
    before do
      create(:job_offerer_profile, job_offerer: post.job_offerer)
      get job_posting_path(post)
    end

    it 'リクエストが成功すること' do
      expect(response.status).to eq 200
    end

    it '求人情報が表示されていること' do
      expect(response.body).to include post.title
    end
  end

  describe 'GET #new' do
    let(:profile) { create(:job_offerer_profile) }

    context '求人者でログインしていない場合' do
      it 'リダイレクトされること' do
        get new_job_posting_path
        expect(response.status).to eq 302
      end
    end

    context '求人者でログインしている場合' do
      it 'リクエストが成功すること' do
        sign_in(profile.job_offerer)
        get new_job_posting_path
        expect(response.status).to eq 200
      end
    end
  end

  describe 'POST #create' do
    let(:profile) { create(:job_offerer_profile) }
    let(:job_offerer) { profile.job_offerer }

    context 'パラメータが有効な場合' do
      before do
        sign_in(job_offerer)
        post job_postings_path(job_offerer), params: {
          job_posting: attributes_for(:job_posting)
        }
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 302
      end

      it '求人が投稿されること' do
        expect(JobPosting.last).to eq job_offerer.job_postings.last
      end

      it 'リダイレクトされること' do
        expect(response).to redirect_to job_postings_path
      end
    end

    context 'パラメータが無効な場合' do
      before do
        sign_in(job_offerer)
        post job_postings_path(job_offerer), params: {
          job_posting: attributes_for(:job_posting, :invalid)
        }
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 200
      end

      it 'エラーが表示されること' do
        expect(response.body).to include 'タイトルを入力してください'
      end
    end
  end

  describe 'GET #edit' do
    let(:profile) { create(:job_offerer_profile) }
    let(:job_offerer) { profile.job_offerer }
    let(:post) { create(:job_posting, job_offerer_id: job_offerer.id) }

    context '投稿主でログインしていない場合' do
      it 'リダイレクトされること' do
        get edit_job_posting_path(post)
        expect(response.status).to eq 302
      end
    end

    context '投稿主でログインしている場合' do
      before do
        sign_in(job_offerer)
        get edit_job_posting_path(post)
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 200
      end

      it '求人情報が表示されること' do
        expect(response.body).to include post.title
      end
    end
  end

  describe 'PUT #update' do
    let(:profile) { create(:job_offerer_profile) }
    let(:job_offerer) { profile.job_offerer }
    let(:post) { create(:job_posting, job_offerer_id: job_offerer.id) }

    context 'パラメータが有効な場合' do
      before do
        sign_in(job_offerer)
        put job_posting_path(post), params: {
          job_posting: attributes_for(:job_posting, :another)
        }
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 302
      end

      it '求人情報が更新されること' do
        expect(JobPosting.find_by(job_offerer_id: job_offerer.id).title)
          .to eq('b' * 40)
      end

      it 'リダイレクトされること' do
        expect(response).to redirect_to post
      end
    end

    context 'パラメータが無効な場合' do
      before do
        sign_in(job_offerer)
        put job_posting_path(post), params: {
          job_posting: attributes_for(:job_posting, :invalid)
        }
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 200
      end

      it 'エラーが表示されること' do
        expect(response.body).to include 'タイトルを入力してください'
      end
    end
  end
end
