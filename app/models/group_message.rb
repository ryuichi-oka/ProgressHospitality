class GroupMessage < ApplicationRecord
  belongs_to :group
  has_many :comments, dependent: :destroy
  has_many :checks, dependent: :destroy

  has_many_attached :files

  def checked_by?(member)
    checks.exists?(member_id: member.id)
  end
end
