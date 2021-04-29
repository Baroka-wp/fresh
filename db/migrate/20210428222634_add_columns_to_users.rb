class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :bio, :text
    add_column :users, :age, :integer
    add_column :users, :pays, :string
    add_column :users, :ville, :string
    add_column :users, :password_digest, :text
  end
end
