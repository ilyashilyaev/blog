class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.references :user, null: false, foreign_key: true
      t.string  :title, null: false
      t.string  :creator_ip_address, null: false
      t.integer :rating, null: false, default: 0
      t.text    :text, null: false
      t.string  :attachment
      t.integer :count_of_comments

      t.timestamps
    end
  end
end
