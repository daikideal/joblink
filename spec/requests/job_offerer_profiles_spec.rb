require 'rails_helper'

RSpec.describe JobOfferers::ProfilesController, type: :request do
  describe 'GET #index' do
    before do
      create(:job_offerer_profile)
      create(:job_offerer_profile, :another)
    end

    it 'リクエストが成功すること' do
      get job_offerers_path
      expect(response.status).to eq 200
    end

    it 'プロフィールが表示されていること' do
      get job_offerers_path
      expect(response.body).to include '戦兎'
      expect(response.body).to include '巧'
    end
  end

  describe 'GET #show' do
    let(:profile) { create(:job_offerer_profile) }

    it 'リクエストが成功すること' do
      get job_offerer_path(profile.job_offerer)
      expect(response.status).to eq 200
    end

    it 'プロフィールが表示されていること' do
      get job_offerer_path(profile.job_offerer)
      expect(response.body).to include '戦兎'
    end
  end

  describe 'GET #new' do
    let(:job_offerer) { create(:job_offerer) }

    context 'ログインしていない場合' do
      it 'リダイレクトされること' do
        get new_job_offerer_profile_path(job_offerer)
        expect(response.status).to eq 302
      end
    end

    context 'ログインしている場合' do
      it 'リクエストが成功すること' do
        sign_in(job_offerer)
        get new_job_offerer_profile_path(job_offerer)
        expect(response.status).to eq 200
      end
    end
  end

  describe 'POST #create' do
    let(:job_offerer) { create(:job_offerer) }

    context 'パラメータが有効な場合' do
      before do
        sign_in(job_offerer)
        post job_offerer_profile_path(job_offerer), params: {
          job_offerer_profile: attributes_for(:job_offerer_profile)
        }
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 302
      end

      it 'プロフィールが登録されること' do
        expect(JobOffererProfile.find_by(job_offerer_id: job_offerer.id))
          .to eq job_offerer.profile
      end
    end

    context 'パラメータが無効な場合' do
      before do
        sign_in(job_offerer)
        post job_offerer_profile_path(job_offerer), params: {
          job_offerer_profile: attributes_for(:job_offerer_profile, :invalid)
        }
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 200
      end

      it 'エラーが表示されること' do
        expect(response.body).to include '名を入力してください'
      end
    end
  end

  describe 'GET #edit' do
    let(:profile) { create(:job_offerer_profile) }
    let(:job_offerer) { profile.job_offerer }

    context 'ログインしていない場合' do
      it 'リダイレクトされること' do
        get edit_job_offerer_profile_path(job_offerer)
        expect(response.status).to eq 302
      end
    end

    context 'ログインしている場合' do
      before do
        sign_in(job_offerer)
        get edit_job_offerer_profile_path(job_offerer)
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 200
      end

      it 'プロフィールが表示されていること' do
        expect(response.body).to include '戦兎'
      end
    end
  end

  describe 'PUT #update' do
    let(:profile) { create(:job_offerer_profile) }
    let(:job_offerer) { profile.job_offerer }

    context 'パラメータが有効な場合' do
      before do
        sign_in(job_offerer)
        put job_offerer_profile_path(job_offerer), params: {
          job_offerer_profile: attributes_for(:job_offerer_profile, :another)
        }
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 302
      end

      it 'プロフィールが更新されること' do
        expect(
          JobOffererProfile.find_by(job_offerer_id: job_offerer.id).first_name
        ).to eq '巧'
      end

      it 'リダイレクトされること' do
        expect(response).to redirect_to job_offerer
      end
    end

    context 'パラメータが無効な場合' do
      before do
        sign_in(job_offerer)
        put job_offerer_profile_path(job_offerer), params: {
          job_offerer_profile: attributes_for(:job_offerer_profile, :invalid)
        }
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 200
      end

      it 'プロフィールが更新されないこと' do
        expect(JobOffererProfile.find_by(job_offerer_id: job_offerer.id))
          .to eq profile
      end

      it 'エラーが表示されること' do
        expect(response.body).to include '名を入力してください'
      end
    end
  end
end
