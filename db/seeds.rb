# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# User.create!(username: "clement", password: "blablba", email: "clement.morisset@yahoo.fr", age: 29, city: "rouen", religion: "protestant", country: "france", gender: "male", language: "french")
# User.create!(username: "rachid", password: "blablba", email: "rachid.morisset@yahoo.fr", age: 22, city: "paris", religion: "musulman", country: "algerie", gender: "male", language: "arab")
# User.create!(username: "davic", password: "blablba", email: "david.morisset@yahoo.fr", age: 45, city: "dreux", religion: "protestant", country: "france",  gender: "male", language: "french")


    CATEGORIES = ["Famille", "Actualité", "Religion", "Amour", "Santé", "Travail", "Célébration" ,"Autres"]
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
    {category: "Célébration",
      photo_filepath: "celebration.jpg"
  },
    {category: "Autres" ,
      photo_filepath: "autre.jpg"
  }

  ]