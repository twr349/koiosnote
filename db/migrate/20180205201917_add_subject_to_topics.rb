class AddSubjectToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :subject_id, :integer
    add_index :topics, :subject_id
  end
end
