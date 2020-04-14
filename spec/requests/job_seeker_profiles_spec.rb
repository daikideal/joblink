# frozen_string_literal: true

require 'rails_helper'

RSpec.describe JobSeekers::ProfilesController, type: :request do
  describe 'GET #index' do
    before do
      create(:job_seeker_profile)
      create(:job_seeker_profile, :another)
    end

    it 'リクエストが成功すること' do
      get job_seekers_path
      expect(response.status).to eq 200
    end

    it 'プロフィールが表示されていること' do
      get job_seekers_path
      expect(response.body).to include '龍我'
      expect(response.body).to include '一海'
    end
  end

  describe 'GET #show' do
    let(:profile) { create(:job_seeker_profile) }

    it 'リクエストが成功すること' do
      get job_seeker_path(profile.job_seeker)
      expect(response.status).to eq 200
    end

    it 'プロフィールが表示されていること' do
      get job_seeker_path(profile.job_seeker)
      expect(response.body).to include '龍我'
    end
  end

  describe 'GET #new' do
    let(:job_seeker) { create(:job_seeker) }

    context 'ログインしていない場合' do
      it 'リダイレクトされること' do
        get new_job_seeker_profile_path(job_seeker)
        expect(response.status).to eq 302
      end
    end

    context 'ログインしている場合' do
      it 'リクエストが成功すること' do
        sign_in(job_seeker)
        get new_job_seeker_profile_path(job_seeker)
        expect(response.status).to eq 200
      end
    end
  end

  describe 'POST #create' do
    let(:job_seeker) { create(:job_seeker) }

    context 'パラメータが有効な場合' do
      before do
        sign_in(job_seeker)
        post job_seeker_profile_path(job_seeker), params: {
          job_seeker_profile: attributes_for(:job_seeker_profile)
        }
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 302
      end

      it 'プロフィールが登録されること' do
        expect(JobSeekerProfile.find_by(job_seeker_id: job_seeker.id))
          .to eq job_seeker.profile
      end
    end

    context 'パラメータが無効な場合' do
      before do
        sign_in(job_seeker)
        post job_seeker_profile_path(job_seeker), params: {
          job_seeker_profile: attributes_for(:job_seeker_profile, :invalid)
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
    let(:profile) { create(:job_seeker_profile) }
    let(:job_seeker) { profile.job_seeker }

    context 'ログインしていない場合' do
      it 'リダイレクトされること' do
        get edit_job_seeker_profile_path(job_seeker)
        expect(response.status).to eq 302
      end
    end

    context 'ログインしている場合' do
      before do
        sign_in(job_seeker)
        get edit_job_seeker_profile_path(job_seeker)
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 200
      end

      it 'プロフィールが表示されていること' do
        expect(response.body).to include '龍我'
      end
    end
  end

  describe 'PUT #update' do
    let(:profile) { create(:job_seeker_profile) }
    let(:job_seeker) { profile.job_seeker }

    context 'パラメータが有効な場合' do
      before do
        sign_in(job_seeker)
        put job_seeker_profile_path(job_seeker), params: {
          job_seeker_profile: attributes_for(:job_seeker_profile, :another)
        }
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 302
      end

      it 'プロフィールが更新されること' do
        expect(
          JobSeekerProfile.find_by(job_seeker_id: job_seeker.id).first_name
        ).to eq '一海'
      end

      it 'リダイレクトされること' do
        expect(response).to redirect_to job_seeker
      end
    end

    context 'パラメータが無効な場合' do
      before do
        sign_in(job_seeker)
        put job_seeker_profile_path(job_seeker), params: {
          job_seeker_profile: attributes_for(:job_seeker_profile, :invalid)
        }
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 200
      end

      it 'プロフィールが更新されないこと' do
        expect(JobSeekerProfile.find_by(job_seeker_id: job_seeker.id))
          .to eq profile
      end

      it 'エラーが表示されること' do
        expect(response.body).to include '名を入力してください'
      end
    end
  end
end
