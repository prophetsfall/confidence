class AddMaxUsersToLeague < ActiveRecord::Migration[5.1]
  def change
    add_column :leagues, :max_members, :integer, default: 100, null:false
  end
end
