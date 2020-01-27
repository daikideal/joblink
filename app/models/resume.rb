class Resume < ApplicationRecord
  belongs_to :job_seeker
  has_rich_text :content
end
