class AddMemberIdToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_reference :schedules, :member, foreign_key: true
  end
end
