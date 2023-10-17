require "pry"

class User

  # attr_accessor :email, :age
  # @@all_users = []
  # @@user_count = 0
  
  # def initialize(email_to_save, age_to_save)
  #   @age = age_to_save
  #   @email
  #   @@user_count += 1
  #   @@all_users << self
  # end
  
  # def self.all
  #   return @@all_users
  # end
  
  # def self.count
  #   return @@user_count
  # end
  
  # --- instance methods
  
  def greet
    puts "Bonjour, monde !"
  end
  
  def say_hello_to_someone(first_name)
    puts "Bonjour, #{first_name} !"
  end
  
  # --- self

  def show_itself
    print "Voici l'instance :"
    puts self
  end
  
  # --- instance variables
  
  def update_email(email_to_update)
    @email = email_to_update
  end
  
  def read_email
    return @email
  end
  
  # --- attr_writer

  attr_writer :mastercard

  def read_mastercard
    return @mastercard
  end

  # --- attr_reader

  attr_reader :birthdate

  def update_birthdate(birthdate_to_update)
    @birthdate = birthdate_to_update
  end

  # --- attr_accessor

  attr_accessor :email
  @@user_count = 0 # on initialise la variable de classe qui sera un compteur du nombre d'instance


  # --- initialize

  attr_accessor :email

  def initialize(email_to_save)
    @email = email_to_save
    puts "On envoie un email de Bienvenue !!"
  end

  def self.count
    return @@user_count
  end

  # --- class variables

  attr_accessor :email
  @@user_count = 0 # on initialise la variable de classe qui sera un compteur du nombre d'instance

  def initialize(email_to_save)
    @email = email_to_save
    @@user_count = @@user_count + 1 # un utilisateur vient d'être créé : on ajoute donc 1 au compteur
  end

  # --- class methods

  attr_accessor :email
  @@user_count = 0 # on initialise la variable de classe

  def initialize(email_to_save)
    @email = email_to_save
    @@user_count = @@user_count + 1
  end

  def self.count
    return @@user_count
  end

  # fin de la classe - pas toucher !
end


binding.pry
puts "End of file ! Goodbye !"