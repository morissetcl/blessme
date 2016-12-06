class AddCounterToPains < ActiveRecord::Migration[5.0]
  def change
    add_column :pains, :thought_counter, :integer, default: 0
  end
end
