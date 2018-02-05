class CreateLeagues < ActiveRecord::Migration[5.1]
  def change
    create_table :leagues do |t|
      t.string :leage_name, null:false


      t.timestamps null:false
    end
  end
end
