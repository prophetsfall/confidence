class AddIndexToLeagues < ActiveRecord::Migration[5.1]
  def change
    add_index :leagues, :league_name, unique: true
  end
end
