class RemoveColumnVerifiedFromIdDocuments < ActiveRecord::Migration[4.2]
  def change
    remove_column :id_documents, :verified
  end
end
