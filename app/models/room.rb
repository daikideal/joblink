class Room < ApplicationRecord
  has_many :messages
  has_many :entries
  has_many :job_offerer, through: :entries
  has_many :job_seeker, through: :entries
end
