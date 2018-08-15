class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string  :title, null: false
      t.string  :creator_ip_address, null: false
      t.integer :rating, null: false, default: 0
      t.text    :text, null: false

      t.timestamps

      t.references :user, null: false, foreign_key: true
    end
  end
end
