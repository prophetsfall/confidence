class AddSeasonScoreToMembership < ActiveRecord::Migration[5.1]
  def change
    add_column :memberships, :season_score, :integer ,default: 0
    rename_column :memberships, :score, :weekly_score
  end
end
