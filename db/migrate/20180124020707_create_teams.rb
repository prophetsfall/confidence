class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :location, null: false
      t.string :team_name, null: false

      t.timestamps
    end
  end
end
