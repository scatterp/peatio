class AddOauthColumnsToAPITokens < ActiveRecord::Migration[4.2]
  def change
    add_column :api_tokens, :oauth_access_token_id, :integer
    add_column :api_tokens, :expire_at, :datetime
    add_column :api_tokens, :scopes, :string
  end
end
