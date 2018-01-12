class CreateCurrencies < ActiveRecord::Migration[5.1]
  def change
    create_table :currencies do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.string :symbol, null: false, default: '฿'
      t.boolean :is_tradable, default: false
      t.boolean :fiat, default: false
      t.jsonb :data

      t.timestamps
    end
    add_index :currencies, :code, unique: true
  end
end
