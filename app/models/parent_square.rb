class ParentSquare < ApplicationRecord
  belongs_to :user, optional: true
  has_many :child_squares, dependent: :destroy
  has_many :favorites, dependent: :destroy
  validates :row_5, presence: { message: "を入力して下さい" }
  accepts_nested_attributes_for :child_squares, allow_destroy: true

  def favorited_by?(user)
    pp "id = #{id}"
    favorites.where(user_id: user).exists?
  end
end
