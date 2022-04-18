class WorkType < ApplicationRecord
  has_many :manuals
  has_many :skills
end
