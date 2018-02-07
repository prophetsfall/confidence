class CreateGamesAgain < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.belongs_to :week
      t.references :home_team
      t.references :away_team
      t.integer :winner_id, default: nil

      t.timestamps
    end
      add_index :games, [:id, :week_id], unique: true
  end
end
