# frozen_string_literal: true

class JobSeekers::ProfilesController < ApplicationController
  include Common

  before_action :authenticate_job_seeker!, except: %i[index show destroy]
  before_action :profile_exists_already, only: %i[new create]
  before_action :require_correct_user, only: %i[edit update]
  before_action :require_admin, only: %i[destroy]
  before_action :check_guest, only: %i[edit update]

  def index
    popular_tags
    @profiles = searched(JobSeekerProfile).page(params[:page])
  end

  def show
    @job_seeker = JobSeeker.find(params[:id])
    @profile = @job_seeker.profile
    confirm_profile
  end

  def new
    @profile = current_job_seeker.build_profile
  end

  def create
    @profile = current_job_seeker.build_profile(profile_params)
    if @profile.save
      redirect_to root_url, notice: 'プロフィール設定が完了しました'
    else
      render 'new', alert: 'プロフィール設定に失敗しました'
    end
  end

  def edit
    @profile = JobSeekerProfile.find_by(job_seeker_id: params[:job_seeker_id])
  end

  def update
    @profile = JobSeekerProfile.find_by(job_seeker_id: params[:job_seeker_id])
    if @profile.update_attributes(profile_params)
      redirect_to @profile.job_seeker, notice: 'プロフィールの更新に成功しました'
    else
      render 'edit', alert: 'プロフィールの更新に失敗しました'
    end
  end

  def destroy
    @job_seeker = JobSeeker.find(params[:id])
    @job_seeker.destroy
    redirect_to job_seekers_path, notice: '求職者を削除しました。'
  end

  private

  def profile_params
    params.require(:job_seeker_profile).permit(
      :first_name, :last_name,
      :first_name_furigana,
      :last_name_furigana,
      :bio,
      :avatar,
      :tag_list
    )
  end

  def check_guest
    @profile = JobSeekerProfile.find_by(job_seeker_id: params[:job_seeker_id])
    return unless @profile.job_seeker.email == 'test_seeker@joblink.com'

    redirect_back(fallback_location: root_path, alert: 'ゲストユーザーのプロフィールは変更できません')
  end
end
