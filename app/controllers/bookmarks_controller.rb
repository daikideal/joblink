# frozen_string_literal: true

class BookmarksController < ApplicationController
  before_action :authenticate_job_seeker!

  def create
    set_posting
    @bookmark = current_job_seeker.bookmarks.create(job_posting_id: params[:job_posting_id])
  end

  def destroy
    set_posting
    @bookmark = Bookmark.find_by(job_posting_id: params[:job_posting_id], job_seeker_id: current_job_seeker.id)
    @bookmark.destroy
  end

  private

  def set_posting
    @job_posting = JobPosting.find(params[:job_posting_id])
  end
end
