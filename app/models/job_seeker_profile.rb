class JobSeekerProfile < ApplicationRecord
  belongs_to :job_seeker
  has_one_attached :avatar
  ransack_alias :profile,
                :first_name_or_last_name_or_first_name_furigana_or_last_name_furigana
  validates :first_name, :last_name,
            :first_name_furigana, :last_name_furigana,
            presence: true
  validates :bio, length: { maximum: 160 }

  acts_as_taggable

  scope :active, -> { includes(:job_seeker).order('job_seekers.current_sign_in_at desc') }

  def full_name
    last_name + ' ' + first_name
  end

  def full_name_furigana
    last_name_furigana + ' ' + first_name_furigana
  end

  def shaped_avatar
    avatar.variant(resize_to_fill: [200, 200]).processed
  end
end
