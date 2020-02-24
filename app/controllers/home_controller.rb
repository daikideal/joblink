class HomeController < ApplicationController
  def home
    @rooms = current_user.rooms.active.limit(3) if current_user.present?
    @popular_postings = JobPosting.popular
    @highlights = JobPosting.order(created_at: :desc).limit(5)
  end
end
