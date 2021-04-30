class CreateBreakships < ActiveRecord::Migration[6.1]
  def change
    create_table :breakships do |t|
      t.integer :breaker_id
      t.integer :breaked_id

      t.timestamps
    end
    add_index :breakships, :breaker_id
    add_index :breakships, :breaked_id
    add_index :breakships, [:breaker_id, :breaked_id], unique: true
  end
end
