class RenameIdDocumentsColumnFromSnToIdDocumentNumber < ActiveRecord::Migration[4.2]
  def change
    rename_column :id_documents, :sn, :id_document_number
  end
end
