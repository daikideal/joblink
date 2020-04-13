# frozen_string_literal: true

class Message < ApplicationRecord
  validates :content, presence: true

  belongs_to :job_offerer, optional: true
  belongs_to :job_seeker, optional: true
  belongs_to :room

  after_create_commit { MessageBroadcastJob.perform_later self }
end
