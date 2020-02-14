class JobPosting < ApplicationRecord
  belongs_to :job_offerer
  has_many :bookmarks, dependent: :destroy
  has_many :job_seekers, through: :bookmarks
  has_one_attached :header
  has_rich_text :content

  acts_as_taggable

  scope :recently, -> { order(updated_at: :desc) }
  scope :popular, lambda {
    find(
      Bookmark.group(:job_posting_id)
              .order('count(job_posting_id) desc')
              .limit(5)
              .pluck(:job_posting_id)
    )
  }

  def bookmarked_by(job_seeker)
    bookmarks.find_by(job_seeker_id: job_seeker)
  end

  def shaped_header
    header.variant(resize_to_fill: [1000, 500]).processed
  end

  def thumbnail
    header.variant(resize_to_fill: [1000, 300]).processed
  end
end
