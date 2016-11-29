class CreatePrayers < ActiveRecord::Migration[5.0]
  def change
    create_table :prayers do |t|
      t.string :title
      t.string :description
      t.references :user, foreign_key: true
      t.references :pain, foreign_key: true

      t.timestamps
    end
  end
end
