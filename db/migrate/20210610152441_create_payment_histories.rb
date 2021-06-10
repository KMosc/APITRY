class CreatePaymentHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_histories do |t|
      t.string :email
      t.string :seat
      t.datetime :starts_at
      t.datetime :ends_at
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
