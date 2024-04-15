class StudentSkill < ApplicationRecord
  belongs_to :students
  belongs_to :skills
end
