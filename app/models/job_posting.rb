class JobPosting < ApplicationRecord
  belongs_to :job_offerer
  has_many :bookmarks, dependent: :destroy
  has_many :job_seekers, through: :bookmarks
  has_one_attached :header
  has_rich_text :content

  acts_as_taggable

  scope :recently, -> { order(updated_at: :desc) }

  def shaped_header
    header.variant(resize_to_fill: [1000, 500]).processed
  end

  def thumbnail
    header.variant(resize_to_fill: [1000, 300]).processed
  end
end
