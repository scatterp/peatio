class AddAasmStateToWithdraws < ActiveRecord::Migration[4.2]
  def change
    add_column :withdraws, :aasm_state, :string
  end
end
