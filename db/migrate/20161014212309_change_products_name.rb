class ChangeProductsName < ActiveRecord::Migration
  def change
  	rename_column :comments, :products_id, :product_id
  end
end
