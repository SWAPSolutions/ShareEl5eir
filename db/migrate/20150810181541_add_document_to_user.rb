class AddDocumentToUser < ActiveRecord::Migration
  def change
    add_column :users, :document, :string
  end
end
