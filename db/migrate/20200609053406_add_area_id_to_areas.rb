class AddAreaIdToAreas < ActiveRecord::Migration[5.2]
  def change
    add_column :areas, :area_id, :integer
  end
end
