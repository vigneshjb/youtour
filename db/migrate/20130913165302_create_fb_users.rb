class CreateFbUsers < ActiveRecord::Migration
  def up
  end

  def change
    create_table :fbuser do |t|
      t.string :photo_link
      t.string :fbid
      t.timestamps
    end
  end

  def down
  end
end
