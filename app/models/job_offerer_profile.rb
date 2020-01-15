class JobOffererProfile < ApplicationRecord
  belongs_to :job_offerer
  has_one_attached :avatar
  validates :first_name, :last_name,
            :first_name_furigana, :last_name_furigana,
            presence: true

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
