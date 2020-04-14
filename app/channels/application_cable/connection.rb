# frozen_string_literal: true

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_job_offerer
    identified_by :current_job_seeker

    def connect
      if env['warden'].user('job_offerer')
        self.current_job_offerer = find_verified_job_offerer
      elsif env['warden'].user('job_seeker')
        self.current_job_seeker = find_verified_job_seeker
      end
    end

    private

    def find_verified_job_offerer
      verified_job_offerer = JobOfferer.find_by(id: env['warden'].user('job_offerer').id)
      return reject_unauthorized_connection unless verified_job_offerer

      verified_job_offerer
    end

    def find_verified_job_seeker
      verified_job_seeker = JobSeeker.find_by(id: env['warden'].user('job_seeker').id)
      return reject_unauthorized_connection unless verified_job_seeker

      verified_job_seeker
    end
  end
end
