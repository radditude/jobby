class AddNotesToPotentialJobs < ActiveRecord::Migration
  def change
    add_column :potential_jobs, :notes, :text
  end
end
