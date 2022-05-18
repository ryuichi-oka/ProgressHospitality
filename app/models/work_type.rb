class WorkType < ApplicationRecord
  has_many :manuals
  has_many :skills

  validates :work_type, presence: true
end
