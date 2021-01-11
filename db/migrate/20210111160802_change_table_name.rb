class ChangeTableName < ActiveRecord::Migration
  def change
    drop_table :owner 
    create_table :owners do |t|
      t.string :username
      t.string :password
    end
  end
end
