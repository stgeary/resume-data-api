class Capstone < ApplicationRecord
  belongs_to :student, optional: true
end
