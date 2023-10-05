class CommentChild < ApplicationRecord
    belongs_to :user 
    belongs_to :comment_parent
end
