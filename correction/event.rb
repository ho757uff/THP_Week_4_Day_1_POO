require 'date'

# Classe représentant un événement
class Event
  # Accesseurs pour les attributs 'start_date', 'duration', 'title' et 'attendees'
  attr_accessor :start_date, :duration, :title, :attendees

  # Constructeur de la classe
  def initialize(start_date, duration, title, attendees)
    @start_date = DateTime.parse(start_date)   # Convertit la date donnée en objet Time
    @duration = duration                   # Durée de l'événement en minutes
    @title = title                         # Titre de l'événement
    @attendees = attendees                 # Liste des participants à l'événement
  end

  # Méthode pour repousser l'événement de 24 heures
  def postpone_24h
    @start_date += 60*60*24  # Ajoute 24 heures (en secondes) à la date de début
  end

  # Méthode pour obtenir la date de fin de l'événement
  def end_date
    return @start_date + duration*60  # Ajoute la durée (en secondes) à la date de début
  end

  # Méthode pour déterminer si l'événement est déjà passé
  def is_past?
    return @start_date < Time.now  # Retourne vrai si la date de début est antérieure à la date actuelle
  end

  # Méthode pour déterminer si l'événement est à venir
  def is_future?
    !self.is_past?  # Utilise la méthode is_past? et retourne l'inverse
  end

  # Méthode pour déterminer si l'événement débute bientôt (dans les 30 prochaines minutes)
  def is_soon?
    return (is_past?) && (@start_date > (Time.now - 30*60))  # Vérifie si l'événement est passé et si sa date de début est dans les 30 dernières minutes
  end

  # Méthode pour afficher l'événement sous forme de chaîne
  def to_s
    puts ">Titre : #{@title}"                   # Affiche le titre
    puts ">Date de début : #{@start_date}"      # Affiche la date de début
    puts ">Durée : #{@duration} minutes"        # Affiche la durée
    print ">Invités :"                           # Prépare l'affichage des invités
    puts @attendees.join(", ")                  # Affiche la liste des invités, séparés par des virgules
  end

  def age_analysis
    age_array = [] #On initialise un array qui va contenir les âges de tous les participants à un évènement
    average = 0 #On initialise une variable pour calculer la moyenne d'âge à l'évènement
  
    @attendees.each do |attendee| #On parcourt tous les participants (objets de type User)
      age_array << attendee.age #leur âge est stocké dans l'array des âges
      average = average + attendee.age #leur âge est additionné pour préparer le calcul de la moyenne
    end
  
    average = average / @attendees.length #on divise la somme des âges pour avoir la moyenne
  
    puts "Voici les âges des participants :"
    puts age_array.join(", ")
    puts "La moyenne d'âge est de #{average} ans"
  end
end

class WorkEvent < Event
  # Constructeur de la classe, modifié
  def initialize(start_date, duration, title, attendees, location)
    @location = location # j'ai rajouté cette ligne

    super(start_date, duration, title, attendees) #fait appel au initialize de la classe Event
  end

  def is_event_acceptable?
    if @attendees.length > 3 || @duration > 60
      puts "Cette réunion ne respecte pas nos bonnes pratiques !"
      return false
    else
      puts "Cette réunion est OK."
      return true
    end
  end
end