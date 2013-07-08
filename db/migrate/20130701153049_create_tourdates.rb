class CreateTourdates < ActiveRecord::Migration
  def change
    create_table :tourdates do |t|
      t.date :startdate
      t.integer :tour_id

      t.timestamps
    end
  end
end
