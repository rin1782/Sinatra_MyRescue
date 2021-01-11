class CreateRescueOwner < ActiveRecord::Migration
  def change
    create_table :owner do |t|
      t.string :username
      t.string :password
    end
  end
end
