class Author < ApplicationRecord
  has_many :articles, dependent: :destroy

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :profile_pic, presence: true
  validates :description, length: { maximum: 3000 }
end