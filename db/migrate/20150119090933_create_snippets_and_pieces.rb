class CreateSnippetsAndPieces < ActiveRecord::Migration
  def change
    create_table :snippets, id: :uuid do |t|
      t.belongs_to :owner, type: :uuid, null: false
      t.string :name, null: false
      t.text :description
      t.timestamps null: false
    end

    add_index :snippets, :owner_id, name: :snippets_ix_owner_id

    create_table :pieces, id: :uuid do |t|
      t.belongs_to :snippet, type: :uuid, null: false
      t.string :name, null: false
      t.text :body, null: false
      t.timestamps null: false
    end

    add_index :pieces, :snippet_id, name: :pieces_ix_snippet_id
  end
end
