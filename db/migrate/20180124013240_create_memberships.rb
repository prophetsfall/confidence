class CreateMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :memberships do |t|
      t.belongs_to :league
      t.belongs_to :user
      t.integer :score, default: 0
      t.boolean :commissioner, default: false

    end
    add_index :memberships, [:league_id, :user_id], unique: true
  end
end
