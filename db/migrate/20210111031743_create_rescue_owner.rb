class CreateRescueOwner < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :username
      t.string :password
    end
  end
end
