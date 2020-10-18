class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :category_name
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
