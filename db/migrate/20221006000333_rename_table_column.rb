class RenameTableColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :foods, :measure_unit, :measurement_unit
  end
end
