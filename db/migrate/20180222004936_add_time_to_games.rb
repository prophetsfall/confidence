class AddTimeToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :gametime, :datetime
  end
end
