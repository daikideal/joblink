class JobOfferers::ProfilesController < ApplicationController
  include Common

  before_action :authenticate_job_offerer!, except: %i[index show destroy]
  before_action :profile_exists_already, only: %i[new create]
  before_action :require_correct_user, only: %i[edit update]
  before_action :require_profile, only: %i[show]
  before_action :require_admin, only: %i[destroy]

  def index
    popular_tags
    @profiles = searched(JobOffererProfile).page(params[:page])
  end

  def show
    @job_offerer = JobOfferer.find(params[:id])
    @profile = @job_offerer.profile
  end

  def new
    @profile = current_job_offerer.build_profile
  end

  def create
    @profile = current_job_offerer.build_profile(profile_params)
    if @profile.save
      redirect_to root_url, notice: 'プロフィール設定が完了しました'
    else
      render 'new', alert: 'プロフィール設定に失敗しました'
    end
  end

  def edit
    @profile = JobOffererProfile.find_by(job_offerer_id: params[:job_offerer_id])
  end

  def update
    @profile = JobOffererProfile.find_by(job_offerer_id: params[:job_offerer_id])
    if @profile.update_attributes(profile_params)
      redirect_to @profile.job_offerer, notice: 'プロフィールの更新に成功しました'
    else
      render 'edit', alert: 'プロフィールの更新に失敗しました'
    end
  end

  def destroy
    @job_offerer = JobOfferer.find(params[:id])
    @job_offerer.destroy
    redirect_to job_offerers_path, notice: '求人者を削除しました。'
  end

  private

  def profile_params
    params.require(:job_offerer_profile).permit(
      :first_name, :last_name,
      :first_name_furigana,
      :last_name_furigana,
      :bio,
      :avatar,
      :tag_list
    )
  end
end
