class CreateTestCasessTagsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :test_cases, :tags do |t|
      t.index [:test_case_id, :tag_id]
      t.index [:tag_id, :test_case_id]
    end
  end
end
