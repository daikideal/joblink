class HomeController < ApplicationController
  def home
    @popular_postings = JobPosting.popular
    @highlights = JobPosting.order(created_at: :desc).limit(5)
  end
end
