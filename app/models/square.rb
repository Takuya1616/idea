class Square < ApplicationRecord
  has_many :parent_squares
  validates :row_5, presence: true
end
