class CreateEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :emails do |t|
      t.references :consultation, foreign_key: true
      t.string :title
      t.text :content
      t.text :description
      t.string :subject
      t.string :photo1_url
      t.string :photo2_url
      t.string :photo3_url
      t.string :article_1_url
      t.string :article_2_url
      t.string :article_3_url

      t.timestamps
    end
  end
end
