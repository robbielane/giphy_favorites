class CreateGifs < ActiveRecord::Migration
  def change
    create_table :gifs do |t|
      t.string :uid
      t.string :url
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
