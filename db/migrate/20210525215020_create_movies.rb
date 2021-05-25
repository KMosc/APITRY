class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.integer :age_restriction
      t.datetime :starts_at
      t.datetime :ends_at
      t.references :genre, null: false, foreign_key: true
      t.references :cinema_hall, null: false, foreign_key: true

      t.timestamps
    end
  end
end
