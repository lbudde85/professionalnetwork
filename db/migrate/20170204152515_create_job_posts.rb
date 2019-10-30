class CreateJobPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :job_posts do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :description
      t.text :skills
      t.integer :experence_level
      t.integer :job_period
      t.text :qualifications
      t.text :questions
      t.attachment :file_attachment

      t.timestamps
    end
  end
end
