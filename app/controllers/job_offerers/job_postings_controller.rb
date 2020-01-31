class JobOfferers::JobPostingsController < ApplicationController
  before_action :authenticate_job_offerer!, except: %i[index show]
  before_action :posting_require_correct_user, only: %i[edit update destroy]

  def index
    @job_postings = JobPosting.order(updated_at: :desc).page(params[:page]).per(5)
  end

  def show
    @job_posting = JobPosting.find(params[:id])
  end

  def new
    @job_posting = current_job_offerer.job_postings.build
  end

  def create
    @job_posting = current_job_offerer.job_postings.build(posting_params)
    if @job_posting.save
      redirect_to job_postings_path, notice: '求人を投稿しました'
    else
      render 'new', alert: '求人の投稿に失敗しました'
    end
  end

  def edit
    @job_posting = JobPosting.find(params[:id])
  end

  def update
    @job_posting = JobPosting.find(params[:id])
    if @job_posting.update_attributes(posting_params)
      redirect_to @job_posting, notice: '求人情報を更新しました'
    else
      render 'edit', alert: '求人情報の更新に失敗しました'
    end
  end

  def destroy
    @job_posting = JobPosting.find(params[:id])
    @job_posting.destroy
    flash[:notice] = '求人を削除しました'
    redirect_to job_postings_path
  end

  private

  def posting_params
    params.require(:job_posting).permit(
      :header,
      :title,
      :content
    )
  end

  def posting_require_correct_user
    @job_posting = JobPosting.find(params[:id])
    return unless @job_posting.job_offerer != current_job_offerer

    redirect_back(fallback_location: root_path, alert: '権限がありません')
  end
end
