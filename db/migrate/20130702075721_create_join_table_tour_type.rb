class CreateJoinTableTourType < ActiveRecord::Migration
  def change
    create_join_table :tours, :types do |t|
       t.index [:tour_id, :type_id]
      # t.index [:type_id, :tour_id]
    end
  end
end
