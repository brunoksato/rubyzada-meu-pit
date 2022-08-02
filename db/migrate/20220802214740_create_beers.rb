class CreateBeers < ActiveRecord::Migration[7.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :image_url
      t.string :type

      t.timestamps
    end
  end
end
