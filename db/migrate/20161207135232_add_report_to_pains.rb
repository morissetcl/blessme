class AddReportToPains < ActiveRecord::Migration[5.0]
  def change
    add_column :pains, :report, :boolean, default: false
  end
end
