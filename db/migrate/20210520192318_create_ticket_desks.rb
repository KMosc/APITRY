class CreateTicketDesks < ActiveRecord::Migration[6.1]
  def change
    create_table :ticket_desks do |t|
      t.string :name
      t.boolean :automated

      t.timestamps
    end
  end
end
