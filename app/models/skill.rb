class Skill < ApplicationRecord
  belongs_to :group
  has_many :skill_details
  has_many :mamber_skills
  has_many :skill_manuals
  belongs_to :work_type

  enum rank: { Erank: 0, Drank: 1, Crank: 2, Brank: 3, Arank: 4 }

  def skill_data
    self.name + "  (" + self.rank_i18n + ")"
  end
end
