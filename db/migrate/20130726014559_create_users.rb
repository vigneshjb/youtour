class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.string :name
      t.string :fbid
      t.string :twid

      t.timestamps
    end
  end
end
