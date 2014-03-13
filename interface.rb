require './lib/organizer'
require 'pry'

system "clear"

def main_menu
  puts "\nWelcome to your Ruby CD Organizer!"
  puts "----------------"
  puts "Press 'A' to add a new Album"
  puts "Press 'S' to search through your Albums"
  puts "Press 'L' to list the Albums in your Library"
  puts "Press 'R' to see your Albums by Artist"
  puts "Press 'X' to Exit"
  input = gets.chomp.downcase

  case input
  when 'a'
    new_album
  when 's'
    search
  when 'l'
    list_albums
  when 'r'
    list_artists
  when 'x'
    puts "Happy Listening!  Good-Bye!"
  end
end

def new_album
    puts "\nPlease enter the name of the Album: "
    new_album = gets.chomp
    puts "\nPlease enter the name of the Artist: "
    new_artist = gets.chomp
    Organizer.new({ :album => new_album, :artist => new_artist })
    puts "\n#{new_album} by #{new_artist} has been added!"
    main_menu
  end

def list_albums
  puts "\n"
   Organizer.all.each do |album|
    puts album.album + " by " + album.artist
  end
  main_menu
end

def list_artists
  artists = []
  puts "\n"
  Organizer.all.map do |album|
    artists <<  album.artist
  end
  artists.uniq!
  artists.map.with_index { |artist, index| puts (index + 1).to_s + ". " + artist }
  puts "Enter the number of the Artist to see their Albums"
  artist_number = gets.chomp.to_i
  Organizer.artist_albums(artists[artist_number - 1]).each do |title|
    puts title
  end
  main_menu
end

def search
  puts "\n"
  puts "Enter the name of the Album or Artist you are searching for"
  search_input = gets.chomp
  results = Organizer.search(search_input)
  puts "\n"
  results.each do |result|
    puts result.album + " by " + result.artist
  end
  main_menu
end
main_menu
