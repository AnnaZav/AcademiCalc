class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, null: false, default: ""
      t.text :deadline, null: false, default: ""
      t.string :max, null: false, default: "0"
      t.string :current
      
      t.belongs_to :subject, index: true

      t.timestamps
    end
  end
end
