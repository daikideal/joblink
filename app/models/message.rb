class Message < ApplicationRecord
  validates :content, presence: true

  belongs_to :job_offerer
  belongs_to :job_seeker
  belongs_to :room

  after_create_commit { MessageBroadcastJob.perform_later self }
end
