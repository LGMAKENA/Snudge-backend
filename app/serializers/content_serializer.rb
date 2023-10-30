class ContentSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :category, :user, :status, :content_media, :content_type

  belongs_to :user
  belongs_to :category
  has_many :content_media
  has_many :comment_parents
end
