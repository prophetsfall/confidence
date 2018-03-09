class AddSlateTime < ActiveRecord::Migration[5.1]
  def change
    add_column :weeks, :main_slate_start, :datetime
  end
end
