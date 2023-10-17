# POO for ruby

class User()
  attr_accessor :email, :age

  @@all_users = []
  @@user_count = 0

  def initialize(email_to_save, age_to_save)
    @email
    @age = age_to_save
    @@user_count += 1
    @@all_users << self
  end
  
  def self.all
    return @@all_users
  end

  def self.count
    return @@user_count
  end
end