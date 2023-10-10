class Category < ApplicationRecord
    has_many :contents, dependent: :destroy

    validates :category_name, {presence: true, uniqueness: true}

end
