class JobSeekers::ResumesController < ApplicationController
  include Common

  before_action :authenticate_job_seeker!
  before_action :require_profile
  before_action :require_correct_user

  def new
    @resume = current_job_seeker.build_resume
  end

  def create
    @resume = current_job_seeker.build_resume(resume_params)
    if @resume.save
      redirect_to job_seeker_path(current_job_seeker), notice: '経歴書を作成しました'
    else
      render new, alert: '経歴書の作成に失敗しました'
    end
  end

  def edit
    @resume = JobSeeker.find(params[:job_seeker_id]).resume
  end

  def update
    @resume = JobSeeker.find(params[:job_seeker_id]).resume
    if @resume.update_attributes(resume_params)
      redirect_to job_seeker_path(@resume.job_seeker), notice: '経歴書を更新しました'
    else
      render 'edit', alert: '経歴書の更新に失敗しました'
    end
  end

  def destroy
    @job_seeker = JobSeeker.find(params[:job_seeker_id])
    @job_seeker.resume.destroy
    redirect_to job_seeker_path(@job_seeker), notice: '経歴書を削除しました。'
  end

  private

  def resume_params
    params.require(:resume).permit(
      :content
    )
  end
end
