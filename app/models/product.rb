class Product < ApplicationRecord

  belongs_to :department

  validates :quantity , presence: true
  validates :name , length: {minimum: 6 }
end
