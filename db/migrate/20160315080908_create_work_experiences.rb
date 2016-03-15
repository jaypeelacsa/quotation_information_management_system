class CreateWorkExperiences < ActiveRecord::Migration
  def change
    create_table :work_experiences do |t|
      t.string :title
      t.string :company_name
      t.string :company_address
      t.date :date_ended

      t.timestamps null: false
    end
  end
end
