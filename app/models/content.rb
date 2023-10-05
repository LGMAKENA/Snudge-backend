class Content < ApplicationRecord
    belongs_to :user
    has_many :notifications
    has_many :comment_parents 
    belongs_to :category
    has_many :wishlists
    has_many :content_media
    has_many :student_subscriptions
    
end
