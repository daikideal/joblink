class JobOffererProfile < ApplicationRecord
  belongs_to :job_offerer
  validates :first_name, :last_name,
            :first_name_furigana, :last_name_furigana,
            presence: true
end
