class CreateTripTrail < ActiveRecord::Migration[5.1]
  def change
    create_table :trip_trails do |t|
      t.string :name
      t.timestamps
    end
  end
end
