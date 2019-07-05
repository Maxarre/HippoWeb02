class CreateConsultations < ActiveRecord::Migration[5.2]
  def change
    create_table :consultations do |t|
      t.references :patient, foreign_key: true
      t.string :status
      t.datetime :start_time
      t.datetime :end_time
      t.string :consultation_type
      t.text :required_documents
      t.text :patient_complain
      t.text :diagnostic
      t.text :care_plan
      t.text :prescription
      t.text :note_patient
      t.string :patient_note_attachment

      t.timestamps
    end
  end
end
