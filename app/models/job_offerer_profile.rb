class JobOffererProfile < ApplicationRecord
  belongs_to :job_offerer
  has_one_attached :avatar
  validates :first_name, :last_name,
            :first_name_furigana, :last_name_furigana,
            presence: true
end
