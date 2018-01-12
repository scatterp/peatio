class AddTrustedIpListToAPITokens < ActiveRecord::Migration[4.2]
  def change
    add_column :api_tokens, :trusted_ip_list, :string
  end
end
