class CreateOwners < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.sting :username
      t.string :password
    end
  end
end
