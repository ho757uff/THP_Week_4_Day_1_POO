# Classe représentant un utilisateur
class User
  # Accesseurs pour les attributs 'age' et 'email'
  attr_accessor :age, :email
  
  # Variable de classe pour stocker tous les utilisateurs créés
  @@all_users = []

  # Constructeur de la classe
  def initialize(email, age)
    @email = email        # Initialisation de l'attribut 'email' avec la valeur passée en argument
    @age = age            # Initialisation de l'attribut 'age' avec la valeur passée en argument
    @@all_users << self   # Ajout de l'instance nouvellement créée à la liste de tous les utilisateurs
  end

  # Méthode de classe pour obtenir la liste de tous les utilisateurs
  def self.all
    @@all_users
  end

  # Méthode de classe pour rechercher un utilisateur par email
  def self.find_by_email(email)
    # Parcourir la liste des utilisateurs
    @@all_users.each do |user|

      # Si l'email de l'utilisateur correspond à l'email recherché
      if user.email == email
        return user   # Retourner cet utilisateur
      end

    end

    # Si aucun utilisateur n'a été trouvé avec cet email
    puts "aucun utilisateur n'a cet email"
    return false
  end

end
