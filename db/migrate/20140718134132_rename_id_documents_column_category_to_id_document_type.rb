class RenameIdDocumentsColumnCategoryToIdDocumentType < ActiveRecord::Migration[4.2]
  def change
    rename_column :id_documents, :category, :id_document_type
  end
end
