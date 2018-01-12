class CreateDocuments < ActiveRecord::Migration[4.2]
  def change
    create_table :documents do |t|
      t.string :key
      t.string :title
      t.text :body
      t.boolean :is_auth
      t.timestamps
    end
  end
end
