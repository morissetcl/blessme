class AddReportToPrayers < ActiveRecord::Migration[5.0]
  def change
    add_column :prayers, :report_prayer, :boolean, default: false
  end
end
