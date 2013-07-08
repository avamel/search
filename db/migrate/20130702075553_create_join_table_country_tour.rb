class CreateJoinTableCountryTour < ActiveRecord::Migration
  def change
    create_join_table :countries, :tours do |t|
       t.index [:country_id, :tour_id]
      # t.index [:tour_id, :country_id]
    end
  end
end
