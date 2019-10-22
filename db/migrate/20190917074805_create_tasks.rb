class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, null:false
      t.string :status, null:false
      t.date :start_date, null:false
      t.date :end_date, null:false
      t.text :content, null:false
      t.string :priority, null:false
      
      t.timestamps
    end
  end
end