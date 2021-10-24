class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.date :registration_date
      t.datetime :deadline
      t.string :status

      t.timestamps
    end
  end
end
