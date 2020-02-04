class JobPosting < ApplicationRecord
  belongs_to :job_offerer
  has_one_attached :header
  has_rich_text :content

  acts_as_taggable

  def shaped_header
    header.variant(resize_to_fill: [1000, 500]).processed
  end

  def thumbnail
    header.variant(resize_to_fill: [1000, 300]).processed
  end
end
