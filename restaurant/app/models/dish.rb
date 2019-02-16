class Dish < ApplicationRecord
    has_many :order_dishes
    has_many :orders, through: :order_dishes
    
    validates :name, presence: true
    validates :price, presence: true
    validates :description, presence: true
    validates :picture, presence: true
end
