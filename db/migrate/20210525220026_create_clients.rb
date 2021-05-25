class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.integer :authentication
      t.integer :age
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
