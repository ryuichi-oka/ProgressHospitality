class RemoveRankFromSkills < ActiveRecord::Migration[6.1]
  def change
    remove_column :skills, :rank, :string
  end
end
