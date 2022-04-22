class Skill < ApplicationRecord
  belongs_to :group
  has_many :skill_details
  has_many :mamber_skills
  belongs_to :work_type
end
