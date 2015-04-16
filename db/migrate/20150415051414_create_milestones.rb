class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.references :goal, index: true
      t.text :description
      t.string :status_milestone
      t.date :est_time_milestone

      t.timestamps null: false
    end
    add_foreign_key :milestones, :goals
  end
end
