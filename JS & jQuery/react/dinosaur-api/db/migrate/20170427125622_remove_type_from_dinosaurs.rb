class RemoveTypeFromDinosaurs < ActiveRecord::Migration[5.0]
  def change
    remove_column :dinosaurs, :type
    add_column :dinosaurs, :dinosaur_type, :string
  end
end
