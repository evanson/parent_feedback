class CreateSchoolDays < ActiveRecord::Migration
  def change
    create_table :school_days do |t|
      t.string :name

      t.timestamps
    end
  end
end
