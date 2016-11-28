class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :age, :integer
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :religion, :string
    add_column :users, :biography, :text
    add_column :users, :language, :string
    add_column :users, :gender, :string
  end
end
