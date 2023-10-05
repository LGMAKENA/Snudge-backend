class CommentParent < ApplicationRecord
    belongs_to :user
    belongs_to :content
    has_many :comment_children
end
