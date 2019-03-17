class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :name, null: false, default: ""
      t.string :kind, null: false, default: ""
      t.integer :tasks_count, default: 0
      
      t.belongs_to :user, index: true
      
      t.timestamps
    end
  end
end
