class ContentSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :category, :user, :status, :content_media

  belongs_to :user
  belongs_to :category
  has_many :content_media
end
