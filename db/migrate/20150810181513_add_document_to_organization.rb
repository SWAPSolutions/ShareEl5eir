class AddDocumentToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :document, :string
  end
end
