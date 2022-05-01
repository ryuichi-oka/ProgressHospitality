class GroupMessage < ApplicationRecord
  belongs_to :group
  has_many :comments, dependent: :destroy

  has_many_attached :files

end
