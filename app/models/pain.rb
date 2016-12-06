class Pain < ApplicationRecord
  CATEGORIES = %w(Famille Actualité Religion Amour Santé Travail Autre)
  acts_as_votable

  belongs_to :user
  has_many :prayers
  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true

end
