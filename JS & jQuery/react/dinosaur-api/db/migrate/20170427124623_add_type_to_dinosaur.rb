class AddTypeToDinosaur < ActiveRecord::Migration[5.0]
  def change
    add_column :dinosaurs, :type, :string
  end
end
