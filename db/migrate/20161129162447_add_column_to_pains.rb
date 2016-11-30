class AddColumnToPains < ActiveRecord::Migration[5.0]
  def change
    add_column :pains, :post_date, :date
  end
end
