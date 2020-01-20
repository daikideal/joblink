class JobSeeker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable
  
  has_one :job_seeker_profile, dependent: :destroy
  has_many :messages, -> { where('job_offerer_id is NULL') }
  has_many :rooms, through: :entries
end
