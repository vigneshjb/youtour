class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.integer, :user_id
      t.string, :from_loc
      t.string, :to_loc
      t.date, :doj
      t.string :desp

      t.timestamps
    end
  end
end
