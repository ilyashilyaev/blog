class CreateRatings < ActiveRecord::Migration[5.2]

  #creat migrate

  def change
    create_table :ratings do |t|

      t.references :ratingable, polymorphic: true, null: false                #указываем ключь, полигамность , 0 значение не может быть
      t.references :user,       foreign_key: true, null: false                #указываем ключь, внешний ключ, 0 значение не может быть
      t.integer :mark, null: false                                            #указываем ключь и отсутствие 0 значения в поле

      t.timestamps
    end
  end
end
