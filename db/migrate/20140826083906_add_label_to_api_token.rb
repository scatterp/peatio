class AddLabelToAPIToken < ActiveRecord::Migration[4.2]
  def change
    add_column :api_tokens, :label, :string
  end
end
