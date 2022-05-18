class SkillDetail < ApplicationRecord
  belongs_to :skill

  validates :body, presence: true
end
