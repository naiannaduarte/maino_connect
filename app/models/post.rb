class Post < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :comments, dependent: :destroy

  validates :title, :content, presence: true
end
