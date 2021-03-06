# frozen_string_literal: true

class Resume < ApplicationRecord
  belongs_to :job_seeker
  has_rich_text :content

  validates :content, presence: true
end
