class CreateCommentParents < ActiveRecord::Migration[7.0]
  def change
    create_table :comment_parents do |t|

      t.timestamps
    end
  end
end
