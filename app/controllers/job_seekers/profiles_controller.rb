class JobSeekers::ProfilesController < ApplicationController
  before_action :authenticate_job_seeker!, except: %i[index show]

  def index
    @job_seekers = JobSeeker.all
  end

  def show
    @job_seeker = JobSeeker.find(params[:id])
    @profile = @job_seeker.job_seeker_profile
  end

  def new
    @profile = current_job_seeker.build_job_seeker_profile
  end

  def create
    @profile = current_job_seeker.build_job_seeker_profile(profile_params)
    if @profile.save
      redirect_to root_url, notice: 'プロフィール設定が完了しました'
    else
      render 'new', alert: 'プロフィール設定に失敗しました'
    end
  end

  def edit
    @profile = current_job_seeker.job_seeker_profile
  end

  def update
    @profile = current_job_seeker.job_seeker_profile
    if @profile.update_attributes(profile_params)
      redirect_to current_job_seeker, notice: 'プロフィールの更新に成功しました'
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
      :resume,
      :avatar
    )
  end
end
