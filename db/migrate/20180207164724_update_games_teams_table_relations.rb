class UpdateGamesTeamsTableRelations < ActiveRecord::Migration[5.1]
  def up
    drop_table :games
  end

  def down
    create_table :games do |t|
      t.belongs_to :week

      t.string :home_team, null: false
      t.string :away_team, null: false
      t.integer :winner_id, default: nil

      t.timestamps
    end
    add_index :games, [:id, :week_id], unique: true
  end
end
