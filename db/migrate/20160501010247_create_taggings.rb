class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings, id: false do |t|
      t.references :tag
      t.references :tagable, polymorphic: true, index: true

      t.timestamps null: false
    end

    add_index(:taggings, [:tag_id, :tagable_id])
    add_index(:taggings, [:tagable_id, :tag_id])
  end
end
