class JobOffererInformation < ApplicationRecord
  belongs_to :job_offerer, optional: true
end
