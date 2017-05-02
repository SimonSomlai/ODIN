class CreateDinosaurs < ActiveRecord::Migration[5.0]
  def change
    create_table :dinosaurs do |t|
      t.string :name
      t.float :weight
      t.float :height
      t.string :image

      t.timestamps
    end
  end
end
