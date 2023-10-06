class User < ApplicationRecord
    has_many :contents
    has_many :notifications
    has_many :comment_parents
    has_many :comment_children
    has_many :student_subscriptions
    has_many :wishlists
    has_secure_password
end
