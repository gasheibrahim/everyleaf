class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :status
      t.date :start_date
      t.date :end_date
      t.text :content
      t.string :priority
      t.timestamps
    end
  end
end
