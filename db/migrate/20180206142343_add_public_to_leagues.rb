class AddPublicToLeagues < ActiveRecord::Migration[5.1]
  def change
    add_column :leagues, :invite_only, :integer, default: 2, null: false
  end
end
