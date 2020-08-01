class Board < ApplicationRecord
  belongs_to :user
  attachment :image

  validates :title, presence: true
  has_many :board_details, dependent: :destroy, inverse_of: :board
  # has_many :favorites,dependent: :destroy
  has_many :board_tag_relations,dependent: :delete_all
  has_many :tags, through: :board_tag_relations
  # has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :board_details,reject_if: :all_blank,allow_destroy: true
end
