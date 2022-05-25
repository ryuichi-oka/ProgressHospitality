class Group < ApplicationRecord

  has_many :members
  has_many :manuals
  has_many :skills
  has_many :group_messages
  has_many :schedules
  belongs_to :admin

  validates :shop_name, presence: true

end
