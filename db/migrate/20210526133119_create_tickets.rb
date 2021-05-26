class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.boolean :paid
      t.references :ticket_desk, null: false, foreign_key: true
      t.references :cinema_hall, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
