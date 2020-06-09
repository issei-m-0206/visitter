class RemoveAreaIdFromArea < ActiveRecord::Migration[5.2]
  def change
    remove_column :areas, :area_id, :integer
  end
end
