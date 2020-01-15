class JobOfferers::ProfilesController < ApplicationController
  before_action :authenticate_job_offerer!, except: %i[index show]

  def index
    @profiles = JobOffererProfile.page(params[:page])
  end

  def show
    @job_offerer = JobOfferer.find(params[:id])
    @profile = @job_offerer.job_offerer_profile
  end

  def new
    @profile = current_job_offerer.build_job_offerer_profile
  end

  def create
    @profile = current_job_offerer.build_job_offerer_profile(profile_params)
    if @profile.save
      redirect_to root_url, notice: 'プロフィール設定が完了しました'
    else
      render 'new', alert: 'プロフィール設定に失敗しました'
    end
  end

  def edit
    @profile = current_job_offerer.job_offerer_profile
  end

  def update
    @profile = current_job_offerer.job_offerer_profile
    if @profile.update_attributes(profile_params)
      redirect_to current_job_offerer, notice: 'プロフィールの更新に成功しました'
    else
      render 'edit', alert: 'プロフィールの更新に失敗しました'
    end
  end

  private

  def profile_params
    params.require(:job_offerer_profile).permit(
      :first_name, :last_name,
      :first_name_furigana,
      :last_name_furigana,
      :bio,
      :avatar
    )
  end
end
