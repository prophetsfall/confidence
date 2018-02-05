class CreatePicks < ActiveRecord::Migration[5.1]
  def change
    create_table :picks do |t|
      t.belongs_to :user
      t.belongs_to :league
      t.belongs_to :game
      t.belongs_to :week

      t.integer :winning_team, null:false
      t.integer :confidence , null:false

      t.timestamps
    end
  end
end
