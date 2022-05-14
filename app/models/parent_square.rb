class ParentSquare < ApplicationRecord
  belongs_to :user
  has_many :child_squares, dependent: :destroy
end
