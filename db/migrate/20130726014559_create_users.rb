class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string, :username
      t.strign, :crypted_password
      t.string, :password_salt
      t.string, :persistance_token
      t.string, :name
      t.string, :fbid
      t.string :twid

      t.timestamps
    end
  end
end
