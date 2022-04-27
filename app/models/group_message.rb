class GroupMessage < ApplicationRecord
  belongs_to :group

  has_many_attached :files

end
