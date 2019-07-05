class AddDatesToEmails < ActiveRecord::Migration[5.2]
  def change
    add_column :emails, :last_update_date, :date
  end
end
