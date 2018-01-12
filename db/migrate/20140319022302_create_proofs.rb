class CreateProofs < ActiveRecord::Migration[4.2]
  def change
    create_table :proofs do |t|
      t.string  :root
      t.integer :currency
      t.boolean :ready, default: false

      t.timestamps
    end
  end
end
