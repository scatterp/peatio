class AddAasmStateToIdDocument < ActiveRecord::Migration[4.2]
  def change
    add_column :id_documents, :aasm_state, :string
  end
end
