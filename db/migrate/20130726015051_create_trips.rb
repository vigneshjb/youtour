class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :tour_id
      t.integer :request_by
      t.boolean :status

      t.timestamps
    end
  end
end
