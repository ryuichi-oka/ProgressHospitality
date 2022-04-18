class Manual < ApplicationRecord
  belongs_to :group
  belongs_to :work_type
  has_many :skill_manuals

  has_many_attached :files


end
