class AddVerifiedToIdDocuments < ActiveRecord::Migration[4.2]
  def change
    add_column :id_documents, :verified, :boolean
  end
end
