class CreateBugsTagsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :bugs, :tags do |t|
      t.index [:bug_id, :tag_id]
      t.index [:tag_id, :bug_id]
    end
  end
end
