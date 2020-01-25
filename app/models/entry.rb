class Entry < ApplicationRecord
  belongs_to :job_offerer, optional: true
  belongs_to :job_seeker, optional: true
  belongs_to :room
end
