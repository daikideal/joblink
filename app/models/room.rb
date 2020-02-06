class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :job_offerer, through: :entries
  has_many :job_seeker, through: :entries
  ransack_alias :partner_job_seeker,
                :job_seeker_profile_first_name_or_job_seeker_profile_last_name
  ransack_alias :partner_job_offerer,
                :job_offerer_profile_first_name_or_job_offerer_profile_last_name

  scope :active, lambda {
    includes(:messages, :job_offerer, :job_seeker)
      .order('messages.created_at desc')
  }
end
