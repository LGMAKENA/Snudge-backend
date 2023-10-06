class CreateCommentParents < ActiveRecord::Migration[7.0]
  def change
    create_table :comment_parents do |t|
      t.references :content,foreign_key: true 
      t.references :user,foreign_key: true 
      t.string :comment
      t.timestamps
    end
  end
end
