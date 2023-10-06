class CreateCommentChildren < ActiveRecord::Migration[7.0]
  def change
    create_table :comment_children do |t|
      t.references :user,foreign_key: true 
      t.references :comment_parent,foreign_key: true 
      t.string :comment
      t.timestamps
    end
  end
end
