class GroupMessage < ApplicationRecord
  belongs_to :group
  has_many :comments, dependent: :destroy
  has_many :checks, dependent: :destroy

  has_many_attached :files

  validates :title, presence: true
  validates :body, presence: true

  def checked_by?(member)
    checks.exists?(member_id: member.id)
  end
end
