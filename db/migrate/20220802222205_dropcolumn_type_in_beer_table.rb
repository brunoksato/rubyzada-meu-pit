class DropcolumnTypeInBeerTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :beers, :type
  end
end
