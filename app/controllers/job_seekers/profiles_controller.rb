class JobSeekers::ProfilesController < ApplicationController
  include Common

  before_action :authenticate_job_seeker!, except: %i[index show]
  before_action :profile_exists_already, only: %i[new create]
  before_action :require_correct_user, only: %i[edit update]

  def index
    popular_tags
    @profiles = searched(JobSeekerProfile)
  end

  def show
    @job_seeker = JobSeeker.find(params[:id])
    @profile = @job_seeker.profile
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
end
