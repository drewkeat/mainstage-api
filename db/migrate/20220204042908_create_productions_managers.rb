class CreateProductionsManagers < ActiveRecord::Migration[6.1]
  def change
    create_table :productions_managers do |t|
      t.integer :manager_id
      t.integer :managed_production_id

      t.timestamps
    end
  end
end
