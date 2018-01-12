class SetTokenIsUsedToFalseAsDefault < ActiveRecord::Migration[4.2]
  def change
    change_column :tokens, :is_used, :boolean, default: false
  end
end
