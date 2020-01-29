class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :job_offerer, through: :entries
  has_many :job_seeker, through: :entries
end
