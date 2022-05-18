class Comment < ApplicationRecord

  belongs_to :member, optional: true
  belongs_to :group_message
  
  validates :comment, presence: true
end
