class UpdateLeaugeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :leagues, :leage_name, :league_name
  end
end
