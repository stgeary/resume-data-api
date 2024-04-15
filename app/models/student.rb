class Student < ApplicationRecord
  has_many :experiences
  has_many :educations
  has_many :student_skills
  has_many :skills, through: :student_skills
  has_many :capstones

  has_secure_password
  validates :email, presence: true, uniqueness: true

  def name
    "#{first_name} #{last_name}"
  end

end
