class CreateBrandProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :brand_profiles do |t|
      t.references :user, foreign_key: true
      t.text :description
      t.references :category, foreign_key: true
      t.text :product_info
      t.string :homepage_url
      t.string :city
      t.string :street
      t.string :phone
      t.attachment :logo

      t.timestamps
    end
  end
end
