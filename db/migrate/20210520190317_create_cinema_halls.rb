class CreateCinemaHalls < ActiveRecord::Migration[6.1]
  def change
    create_table :cinema_halls do |t|
      t.integer :volume

      t.timestamps
    end
  end
end
