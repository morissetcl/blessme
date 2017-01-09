class AddSlugToPains < ActiveRecord::Migration[5.0]
  def change
    add_column :pains, :slug, :string
  end
end
