

class Pain < ApplicationRecord

    CATEGORIES = ["Famille", "Actualité", "Religion", "Amour", "Santé", "Travail", "Autre"]
    CATEGORIES_PHOTOS = [
    {category: "Famille" ,
      photo_filepath: "famille.jpg"
  },
    {category: "Actualité",
      photo_filepath: "actualité.jpg"
  },
    {category: "Religion",
      photo_filepath: "religion.jpg"
  },
    {category: "Amour",
      photo_filepath: "amour.jpg"
  },
    {category: "Santé" ,
      photo_filepath: "santé.jpg"
  },
    {category: "Travail",
      photo_filepath: "travail.jpg"
  },
    {category: "Autres" ,
      photo_filepath: "autre.jpg"
  }

  ]

  belongs_to :user
  has_many :prayers
  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
end
