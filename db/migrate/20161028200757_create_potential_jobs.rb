class CreatePotentialJobs < ActiveRecord::Migration
  def change
    create_table :potential_jobs do |t|
      t.string :job_title
      t.string :link
      t.integer :company_id
      t.timestamps null: false
      t.string :status, null: false, default: "not yet applied"
    end
  end
end
