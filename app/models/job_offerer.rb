class JobOfferer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  has_one :job_offerer_profile, dependent: :destroy
  has_many :job_postings, dependent: :destroy
  has_many :messages, -> { where('job_seeker_id is NULL') }
end
