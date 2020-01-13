class JobSeekerProfile < ApplicationRecord
  belongs_to :job_seeker
  has_one_attached :avatar
  has_rich_text :resume
  validates :first_name, :last_name,
            :first_name_furigana, :last_name_furigana,
            presence: true

  def shaped_avatar
    avatar.variant(resize_to_fill: [200, 200]).processed
  end
end
