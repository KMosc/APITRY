class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.references :ticket_desk, null: false, foreign_key: true
      t.references :cinema_hall, null: false, foreign_key: true
      t.boolean :paid

      t.timestamps
    end
  end
end
