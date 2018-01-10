class CreateTickets < ActiveRecord::Migration[4.2]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :content
      t.string :aasm_state
      t.integer :author_id

      t.timestamps
    end
  end
end
