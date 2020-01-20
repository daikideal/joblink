class Entry < ApplicationRecord
  belongs_to :job_offerer
  belongs_to :job_seeker
  belongs_to :room
end
