class CreateIntents < ActiveRecord::Migration
  def change
    create_table :intents do |t|
      t.text :description
      t.references :milestone, index: true
      t.string :status_intent

      t.timestamps null: false
    end
    add_foreign_key :intents, :milestones
  end
end
