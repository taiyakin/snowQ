class AddIndexToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_index :questions, :text, length: 32
  end
end
