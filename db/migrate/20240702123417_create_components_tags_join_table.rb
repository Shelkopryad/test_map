class CreateComponentsTagsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :components, :tags do |t|
      t.index [:component_id, :tag_id]
      t.index [:tag_id, :component_id]
    end
  end
end
