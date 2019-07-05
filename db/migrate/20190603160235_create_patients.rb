class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.references :user, foreign_key: true
      t.string :gender
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :job_title
      t.string :address
      t.string :city
      t.string :zipcode
      t.date :date_of_birth

      t.timestamps
    end
  end
end
