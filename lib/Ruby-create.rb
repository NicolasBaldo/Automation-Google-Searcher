require 'fileutils'

def create_ruby_project(project_name)
  # Vérifier si le nom du projet est fourni
  if project_name.nil? || project_name.include?(' ')
    puts 'Veuillez fournir un seul mot comme nom de projet.'
    puts 'Exemple: ruby Ruby-create.rb mon_projet'
    exit(1)
  end

  # Créer le dossier du projet
  FileUtils.mkdir(project_name)

  # Changer le répertoire de travail
  Dir.chdir(project_name)

  # Créer le Gemfile
  gemfile_content = <<~GEMFILE
    source 'https://rubygems.org'
    
    gem 'rspec'
  GEMFILE

  File.write('Gemfile', gemfile_content)

  # Initialiser Git
  `git init`

  # Créer le fichier .env
  File.write('.env', '')

  # Ajouter .env au fichier .gitignore
  File.open('.gitignore', 'a') { |file| file.puts('.env') }

  # Créer le dossier lib
  FileUtils.mkdir('lib')

  # Initialiser RSpec
  `rspec --init`

  # Créer le fichier Readme.md
  readme_content = "# #{project_name.capitalize}\n\nThis is a Ruby program."
  File.write('Readme.md', readme_content)

  puts "Le projet Ruby '#{project_name}' a été créé avec succès!"
end

# Vérifier si le script est appelé avec un argument
if ARGV.empty?
  puts 'Veuillez fournir un nom pour le projet.'
  puts 'Exemple: ruby Ruby-create.rb mon_projet'
  exit(1)
end

# Récupérer le nom du projet depuis les arguments
project_name = ARGV[0]

# Appeler la fonction pour créer le projet
create_ruby_project(project_name)
