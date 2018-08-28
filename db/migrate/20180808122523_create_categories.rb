class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|

      t.integer :type_of, null: false, default: 0
      t.string  :name,    null: false

      t.timestamps
    end
  end
end
