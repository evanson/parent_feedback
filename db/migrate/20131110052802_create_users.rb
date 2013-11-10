class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :email
      t.string :user_role
      t.string :password

      t.timestamps
    end
  end
end
