class CreateTestCases < ActiveRecord::Migration[7.1]
  def change
    create_table :test_cases do |t|
      t.string :name
      t.text :steps
      t.boolean :to_test
      t.timestamps
    end
  end
end
