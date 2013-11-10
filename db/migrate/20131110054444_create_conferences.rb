class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.date :confdate
      t.time :conftime

      t.timestamps
    end
  end
end
