class CreateContractorProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :contractor_profiles do |t|
      t.references :user, foreign_key: true
      t.text :description
      t.string :contact_person
      t.string :contact_position
      t.string :contact_email
      t.string :homepage_url
      t.string :city
      t.string :street
      t.string :phone
      t.attachment :logo

      t.timestamps
    end
  end
end
