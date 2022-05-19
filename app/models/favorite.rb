class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :parent_square

  validates_uniqueness_of :parent_square_id, scope: :user_id
end
