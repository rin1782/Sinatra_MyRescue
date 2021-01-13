class ChangePasswordToPasswordDigestInOwners < ActiveRecord::Migration
  def change
    remove_column :owners, :password, :string
    add_column :owners, :password_digest, :string
  end
end
