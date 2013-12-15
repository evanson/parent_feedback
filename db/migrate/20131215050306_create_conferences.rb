class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.date :confDate
      t.time :confTime
      t.integer :instructor_id

      t.timestamps
    end
  end
end
