require 'launchy'

def open_google_search(query)
    # Vérifier si l'ARGV (query) est vide
    
    if query.nil? || query.empty?
      puts "Usage: ruby google_searcher.rb <search_query>"
      puts "Example: ruby google_searcher.rb how to center a div"
      exit
    end
  
    # Construire l'URL de recherche Google
    search_url = "https://www.google.com/search?q=#{URI.encode(query)}"
  
    # Ouvrir un nouvel onglet Google Chrome avec l'URL
    Launchy.open(search_url)
  
    puts "Recherche Google lancée pour : #{query}"
  end
  
  # Récupérer l'ARGV de l'utilisateur
  search_query = ARGV.join(" ")
  
  # Appeler la fonction pour ouvrir la recherche Google
  open_google_search(search_query)
  