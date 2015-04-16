class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.references :user, index: true
      t.references :project, index: true
      t.text :description
      t.string :status_goal
      t.date :est_time_goal

      t.timestamps null: false
    end
    add_foreign_key :goals, :users
    add_foreign_key :goals, :projects
  end
end
