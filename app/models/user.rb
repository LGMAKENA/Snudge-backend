class User < ApplicationRecord
    has_many :contents
    has_many :notifications
    has_many :comment_parents
    has_many :comment_children
    has_many :student_subscriptions
    has_many :wishlists
    has_secure_password

    validates :password, presence: true,on: :create
    validates :full_name, presence: true
    validates :role, presence: true
    validates :email, {presence: true, uniqueness: true}
    
end
