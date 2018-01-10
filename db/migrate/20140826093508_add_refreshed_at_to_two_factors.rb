class AddRefreshedAtToTwoFactors < ActiveRecord::Migration[4.2]
  def change
    add_column :two_factors, :refreshed_at, :timestamp
  end
end
