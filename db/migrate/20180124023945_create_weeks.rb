class CreateWeeks < ActiveRecord::Migration[5.1]
  def change
    create_table :weeks do |t|
      t.integer :week_number, null: false
      t.integer :year, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.timestamps
    end
    add_index :weeks, [ :week_number, :year ], unique: true
  end
end
