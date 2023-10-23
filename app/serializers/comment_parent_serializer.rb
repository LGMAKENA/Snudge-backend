class CommentParentSerializer < ActiveModel::Serializer
  attributes :id, :comment
  belongs_to :user 
end
