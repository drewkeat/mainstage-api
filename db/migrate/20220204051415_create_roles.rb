class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.references :production, null: false, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.string :name
      t.string :role_type

      t.timestamps
    end
  end
end
