class AddInfoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :tos_confirmed, :boolean, default: false
    add_column :users, :user_type, :integer
    add_column :users, :company_name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_reference :users, :country, foreign_key: true
  end
end
