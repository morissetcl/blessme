class AddAudioToPrayers < ActiveRecord::Migration[5.0]
  def change
    add_column :prayers, :audio, :string
  end
end
