class CreateAdoptables < ActiveRecord::Migration
  def change
    create_table :adoptables do |t|
      t.string :pet_name
      t.boolean :pet_avail
      t.text :pet_desc
      t.string :pet_pic
      t.integer :owner_id
     end
  end
end
