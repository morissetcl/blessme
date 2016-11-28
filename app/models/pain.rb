class Pain < ApplicationRecord
  belongs_to :user
  has_many :prayer
  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
end
