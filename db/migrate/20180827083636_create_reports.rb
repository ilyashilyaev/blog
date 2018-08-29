class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.references  :user,           null: false, foreign_key: true
      t.references  :article,        null: false, foreign_key: true
      t.text        :text,           null: false
      t.references  :category,       null: false, foreign_key: true

      t.timestamps

    end
    add_index(:reports, [:user_id, :article_id],unique: true)
  end
end
