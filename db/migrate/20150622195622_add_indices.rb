class AddIndices < ActiveRecord::Migration
  def change
    add_index :assemblies, :name
    add_index :sequences, :assembly_id
    add_index :genes, :sequence_id
    add_index :hits, [:subject_id, :subject_type]
  end
end
