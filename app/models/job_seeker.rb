class JobSeeker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable
  
  has_one :profile, class_name: 'JobSeekerProfile', dependent: :destroy
  has_one :resume, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :job_postings, through: :bookmarks
  has_many :messages, -> { where('job_offerer_id is NULL') }, dependent: :nullify
  has_many :entries, dependent: :nullify
  has_many :rooms, through: :entries

  def bookmarked_postings
    job_postings.includes(:bookmarks).order('bookmarks.created_at desc')
  end

  def leave(entry)
    entry.update(job_seeker_id: nil)
  end
end
