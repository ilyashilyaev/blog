class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|

      t.references :article,   foreign_key: true
      t.references :report,    foreign_key: true

      t.integer :type_of, null: false, default: 0
      t.string  :name,    null: false

      t.timestamps
    end
    add_index :categories, [:article_id, :report_id]
  end
end
