class Bookmark < ApplicationRecord
  belongs_to :job_seeker
  belongs_to :job_posting
end
