class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.text :name, :description, :address, :city
      t.float :price
      t.text :type
      t.timestamps null: false
    end
  end
end
