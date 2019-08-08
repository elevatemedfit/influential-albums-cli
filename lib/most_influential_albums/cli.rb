class MostInfluentialAlbums::CLI

  def call
    MostInfluentialAlbums::Scraper.new.make_albums
    puts "Welcome to the 40 most influential albums of all time"
    start
  end

  def start
    puts "\nWhat album would you like to see? [1-40]\n"
    print_albums
    puts "\nChoose a corresponding number to learn more about each album? [1-40]"

    input = gets.strip.to_i
    album = is_valid_input(input)

    puts ""
    puts "Would you like related albums for #{album.album_name} [y/n]?"
    input = gets.strip.downcase
      
    if input == "y"
      print_related_albums(album)
    elsif input == "n"
      puts "\nThank you! Have a great day!"
      exit
    else
      puts "\nI don't understand that answer."
      start
    end

    puts "\nWould you like to see another album? [y/n]"

    input = gets.strip.downcase
    if input == "y"
      start
    elsif input == "n"
      puts "\nThank you! Have a great day!"
      exit
    else
      puts "\nI don't understand that answer."
      start
    end
  end

  def print_albums
    puts ""
    puts "---------- albums ----------"
    puts ""
    MostInfluentialAlbums::Album.all.each.with_index do |album, index|
      puts "#{index+1}. #{album.album_name} - #{album.artist_name}"
    end
  end


  def print_album(album)
    puts "\n----------- #{album.album_name} - by #{album.artist_name} -----------\n"
    puts ""
    puts "                    Release Year: #{album.album_year}\n"
    puts ""
    puts "\n-----------------Album Description--------------"
    puts ""
    puts "\n...#{album.album_description}\n"
  end

  def print_related_albums(album)
    puts ""
    puts "                         ---------- Related Albums and Artists ----------"
    puts ""
    puts "#{album.related_albums}"
  end

  def is_valid_input(input)
    if (1..40).include?(input) 
      album = MostInfluentialAlbums::Album.find(input)
      print_album(album)
      album
    else
      puts "\nIncorrect response. Please choose again with a number between [1-40]!"
      new_input = gets.strip.to_i
      is_valid_input(new_input)
    end
  end
end



