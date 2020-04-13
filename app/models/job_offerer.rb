# frozen_string_literal: true

class JobOfferer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  has_one :profile, class_name: 'JobOffererProfile', dependent: :destroy
  has_many :job_postings, dependent: :destroy
  has_many :messages, -> { where('job_seeker_id is NULL') }, dependent: :nullify
  has_many :entries, dependent: :nullify
  has_many :rooms, through: :entries

  def leave(entry)
    entry.update(job_offerer_id: nil)
  end
end
