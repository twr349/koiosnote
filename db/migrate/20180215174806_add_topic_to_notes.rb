class AddTopicToNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :topic_id, :interger
    add_index :notes, :topic_id
  end
end
