class Product < ApplicationRecord
  validates :quantity , presence: true
  validates :name , length: {minimum: 6 }
end
