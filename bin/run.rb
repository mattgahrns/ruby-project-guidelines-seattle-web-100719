require_relative '../config/environment'

#curr stands for current. i.e. currUser = current user. curr used at the begining of a method name means 
#that method only works with the current user's favorites.

$currUser = nil

def find_or_create_user_by_username
    puts "To start enter your username or create one and press enter to sign up:"
    username = gets.chomp
    if User.find_by(username: username) == nil
        User.create(username: username)
        $currUser = User.find_by(username: username)
    else
        $currUser = User.find_by(username: username)
    end
    puts "Welcome #{$currUser.username}!"
end

def find_movie_by_title
    puts "Enter the title of the movie you wish to find:"
    title = gets.chomp
    url = "http://www.omdbapi.com/?t=#{title}&apikey=5b27a2ad"
    response = HTTParty.get(url)
    res = response.parsed_response
    while res["Title"] == nil do
        puts "Movie not found, please try again!"
        title = gets.chomp
        url = "http://www.omdbapi.com/?t=#{title}&apikey=5b27a2ad"
        response = HTTParty.get(url)
        res = response.parsed_response
    end
    movie = new_movie(res)
    movie
end

def find_movie_by_title_and_display
    puts "Enter the title of the movie you wish to find:"
    title = gets.chomp
    url = "http://www.omdbapi.com/?t=#{title}&apikey=5b27a2ad"
    response = HTTParty.get(url)
    res = response.parsed_response
    while res["Title"] == nil do
        puts "Movie not found, please try again!"
        title = gets.chomp
        url = "http://www.omdbapi.com/?t=#{title}&apikey=5b27a2ad"
        response = HTTParty.get(url)
        res = response.parsed_response
    end
    movie = new_movie(res)
    display_movie(movie)
end

def find_movie_by_imdb_id
    puts "Enter the IMDb ID of the movie you wish to find:"
    imdbid = gets.chomp
    url = "http://www.omdbapi.com/?i=#{imdbid}&apikey=5b27a2ad"
    response = HTTParty.get(url)
    res = response.parsed_response
    while res["Title"] == nil do
        puts "Movie not found, please try again!"
        imdbid = gets.chomp
        url = "http://www.omdbapi.com/?i=#{imdbid}&apikey=5b27a2ad"
        response = HTTParty.get(url)
        res = response.parsed_response
    end
    movie = new_movie(res)
    movie
end

def find_movie_by_imdb_id_and_display
    puts "Enter the IMDb ID of the movie you wish to find:"
    imdbid = gets.chomp
    url = "http://www.omdbapi.com/?i=#{imdbid}&apikey=5b27a2ad"
    response = HTTParty.get(url)
    res = response.parsed_response
    while res["Title"] == nil do
        puts "Movie not found, please try again!"
        imdbid = gets.chomp
        url = "http://www.omdbapi.com/?i=#{imdbid}&apikey=5b27a2ad"
        response = HTTParty.get(url)
        res = response.parsed_response
    end
    movie = new_movie(res)
    display_movie(movie)
end

def new_movie(res)
    title = res["Title"]
    year = res["Year"]
    rated = res["Rated"]
    released = res["Released"]
    runtime = res["Runtime"]
    genre = res["Genre"]
    director = res["Director"]
    writer = res["Writer"]
    actors = res["Actors"]
    plot = res["Plot"]
    language = res["Language"]
    country = res["Country"]
    awards = res["Awards"]
    poster = res["Poster"]
    metascore = res["Metascore"]
    imdbrating = res["imdbRating"]
    imdbvotes = res["imdbVotes"]
    imdbid = res["imdbID"]
    dvd = res["DVD"]
    boxoffice = res["BoxOffice"]
    production = res["Production"]
    website = res["Website"]
    Movie.new(title: title, year: year, rated: rated, released: released, runtime: runtime, genre: genre, director: director, writer: writer, actors: actors, plot: plot, language: language, country: country, awards: awards, poster: poster, metascore: metascore, imdbrating: imdbrating, imdbvotes: imdbvotes, imdbid: imdbid, dvd: dvd, boxoffice: boxoffice, production: production, website: website)
end

def create_movie(res)
    title = res["Title"]
    year = res["Year"]
    rated = res["Rated"]
    released = res["Released"]
    runtime = res["Runtime"]
    genre = res["Genre"]
    director = res["Director"]
    writer = res["Writer"]
    actors = res["Actors"]
    plot = res["Plot"]
    language = res["Language"]
    country = res["Country"]
    awards = res["Awards"]
    poster = res["Poster"]
    metascore = res["Metascore"]
    imdbrating = res["imdbRating"]
    imdbvotes = res["imdbVotes"]
    imdbid = res["imdbID"]
    dvd = res["DVD"]
    boxoffice = res["BoxOffice"]
    production = res["Production"]
    website = res["Website"]
    Movie.create(title: title, year: year, rated: rated, released: released, runtime: runtime, genre: genre, director: director, writer: writer, actors: actors, plot: plot, language: language, country: country, awards: awards, poster: poster, metascore: metascore, imdbrating: imdbrating, imdbvotes: imdbvotes, imdbid: imdbid, dvd: dvd, boxoffice: boxoffice, production: production, website: website)
end

def create_movie_by_title
    puts "Enter the title of the movie you wish to find:"
    title = gets.chomp
    url = "http://www.omdbapi.com/?t=#{title}&apikey=5b27a2ad"
    response = HTTParty.get(url)
    res = response.parsed_response
    while res["Title"] == nil do
        puts "Movie not found, please try again!"
        title = gets.chomp
        url = "http://www.omdbapi.com/?t=#{title}&apikey=5b27a2ad"
        response = HTTParty.get(url)
        res = response.parsed_response
    end
    if Movie.find_by(title: new_movie(res).title) == nil
        movie = create_movie(res)
    else
        movie = Movie.find_by(title: new_movie(res).title)
    end
    movie
end

def create_movie_by_imdb_id
    puts "Enter the IMDb ID of the movie you wish to find:"
    imdbid = gets.chomp
    url = "http://www.omdbapi.com/?i=#{imdbid}&apikey=5b27a2ad"
    response = HTTParty.get(url)
    res = response.parsed_response
    while res["Title"] == nil do
        puts "Movie not found, please try again!"
        imdbid = gets.chomp
        url = "http://www.omdbapi.com/?i=#{imdbid}&apikey=5b27a2ad"
        response = HTTParty.get(url)
        res = response.parsed_response
    end
    if Movie.find_by(title: new_movie(res).title) == nil
        movie = create_movie(res)
    else
        movie = Movie.find_by(title: new_movie(res).title)
    end
    movie
end

def add_movie_to_favorites
    puts "Add favorite movie by 'IMDb id' or 'title'?"
    input = gets.chomp
    if input == "IMDb id" || input == "id"
        movie = create_movie_by_imdb_id
        Favorite.create(user_id: $currUser.id, movie_id: movie.id)
    elsif input == "title" || input == "Title"
        movie = create_movie_by_title
        Favorite.create(user_id: $currUser.id, movie_id: movie.id)
    else
        puts "Invalid input please try again from the menu."
    end
end

def display_movie(movie)
    puts ""
    puts "Title: #{movie.title}"
    puts "Year: #{movie.year}"
    puts "Rated: #{movie.rated}"
    puts "Released: #{movie.released}"
    puts "Runtime: #{movie.runtime}"
    puts "Genre: #{movie.genre}"
    puts "Director: #{movie.director}"
    puts "Writer: #{movie.writer}"
    puts "Stars: #{movie.actors}"
    puts "Plot: #{movie.plot}"
    puts "Langauge: #{movie.language}"
    puts "Country: #{movie.country}"
    puts "Awards: #{movie.awards}"
    puts "Poster: #{movie.poster}"
    puts "Metascore: #{movie.metascore}"
    puts "IMDb rating: #{movie.imdbrating}"
    puts "IMDb votes: #{movie.imdbvotes}"
    puts "IMDb id: #{movie.imdbid}"
    puts "DVD released: #{movie.dvd}"
    puts "Box office earnings: #{movie.boxoffice}"
    puts "Production: #{movie.production}"
    puts "Website: #{movie.website}"
end

def display_movie_with_id(movie)
    puts "Title: #{movie.title}"
    puts "Year: #{movie.year}"
    puts "Rated: #{movie.rated}"
    puts "Released: #{movie.released}"
    puts "Runtime: #{movie.runtime}"
    puts "Genre: #{movie.genre}"
    puts "Director: #{movie.director}"
    puts "Writer: #{movie.writer}"
    puts "Stars: #{movie.actors}"
    puts "Plot: #{movie.plot}"
    puts "Langauge: #{movie.language}"
    puts "Country: #{movie.country}"
    puts "Awards: #{movie.awards}"
    puts "Poster: #{movie.poster}"
    puts "Metascore: #{movie.metascore}"
    puts "IMDb rating: #{movie.imdbrating}"
    puts "IMDb votes: #{movie.imdbvotes}"
    puts "IMDb id: #{movie.imdbid}"
    puts "DVD released: #{movie.dvd}"
    puts "Box office earnings: #{movie.boxoffice}"
    puts "Production: #{movie.production}"
    puts "Website: #{movie.website}"
    puts "ID: #{movie.id}"
end

def curr_favorites
    res = []
    Favorite.where("user_id = ?", $currUser.id).each do |fav|
        Movie.where("id = ?", fav.movie_id).each do |movie|
            res << movie
        end
    end
    res
end

def display_curr_favorites
    count = 0
    puts ""
    puts "#{$currUser.username}'s favorites:"
    Favorite.where("user_id = ?", $currUser.id).each do |fav|
        Movie.where("id = ?", fav.movie_id).each do |movie|
            count += 1
            puts "#{count}) ~~~~~~~~~~~~"
            display_movie_with_id(movie)
            puts ""
        end
    end
end

def display_curr_favorites_titles_only
    count = 0
    puts ""
    puts "#{$currUser.username}'s favorites (titles only):"
    Favorite.where("user_id = ?", $currUser.id).each do |fav|
        Movie.where("id = ?", fav.movie_id).each do |movie|
            count += 1
            puts "#{count}) ~~~~~~~~~~~~"
            puts movie.title
            puts ""
        end
    end
end

def view_poster
    puts "Which movie poster would you like to see?"
    movie = find_movie_by_title
    if movie.poster == "N/A"
        puts "Sorry this movie does not have a poster on IMDb"
    else
        Launchy.open(movie.poster)
        puts "Opening..."
    end
end

def view_website
    puts "Which movie website would you like to see?"
    movie = find_movie_by_title
    if movie.website == "N/A"
        puts "Sorry this movie does not have a website listed on IMDb"
    else
        Launchy.open(movie.website)
        puts "Opening..."
    end
end

def curr_over_one_hundred_million_box_office
    res = curr_favorites
    res.delete_if{|movie| movie.boxoffice == "N/A"}
    res.delete_if{|movie| movie.boxoffice.split(/[$,]+/).join.to_i < 100000000}
    count = 0
    puts "#{$currUser.username}'s favorite movies with over $100 million box office earnings:"
    if res.empty?
        puts "No favorites earned over $100 million."
    else
        res.each do |movie|
            count += 1
            puts "#{count}) ~~~~~~~~~~~"
            puts movie.title
            puts movie.boxoffice
        end
    end
end

def curr_over_eight_star_imdb_rating
    res = curr_favorites
    res.delete_if{|movie| movie.imdbrating.to_f < 8.0}
    count = 0
    puts "#{$currUser.username}'s favorite movies with over 8 stars on IMDb:"
    if res.empty?
        puts "No favorites have over 8 stars."
    else
        res.each do |movie|
            count += 1
            puts "#{count}) ~~~~~~~~~~~"
            puts movie.title
            puts movie.imdbrating
        end
    end
end

def most_popular_movie
    # SELECT movie_id, COUNT(movie_id)
    # FROM favorites
    # GROUP BY movie_id
    # ORDER BY COUNT(movie_id) DESC LIMIT 1
    temp = Favorite.group(:movie_id).order('count_movie_id DESC').limit(1).count(:movie_id) # => {7=>2}
    movie_id = temp.keys
    Movie.where("id = ?", movie_id).each do |movie|
        puts "The most popular (favorited) movie is:"
        puts movie.title
    end
end

def movie_with_most_star_ratings
    max = 0
    max_movie = nil
    res = Movie.all
    res.each do |movie| 
        if movie.imdbvotes.split(/[,]+/).join.to_i > max
            max = movie.imdbvotes.split(/[,]+/).join.to_i
            max_movie = movie
        end
    end
    puts "The movie with the most IMDb star ratings is:"
    puts "#{max_movie.title} with #{max_movie.imdbvotes} votes!"
end

def sub_menu
    input = nil
    while input != "back" do
        puts ""
        puts "ANALYTICS MENU".colorize(:color => :green, :background => :light_blue)
        puts "1. Show your favorite movies that earned over $100 million at the box office"
        puts "2. Show your favorite movies that have over 8 stars on IMDb"
        puts "3. Show the most popular (favorited) movie overall"
        puts "4. Show the movie with the most IMDb star ratings"
        puts "Enter 'back' to return to main menu or 'exit' to close the program."
        input = gets.chomp
        if input == "1"
            curr_over_one_hundred_million_box_office
        elsif input == "2"
            curr_over_eight_star_imdb_rating
        elsif input == "3"
            most_popular_movie
        elsif input == "4"
            movie_with_most_star_ratings
        elsif input == "back"
            puts "Returning to main menu...".cyan
        elsif input == "exit"
            return input
        else
            puts "Invalid input please try again!".red
        end
    end
end

def main_menu
    input = nil
    while input != "exit" do
        puts ""
        puts " MENU ".colorize(:color => :green, :background => :light_blue)
        puts "Please chose a command from below and enter the corresponding number:"
        puts "1. Find a movie by title"
        puts "2. Find a movie by IMDb ID"
        puts "3. Add a movie to your favorites"
        puts "4. List your favorite movies"
        puts "5. Find a movie and view its poster in your default browser"
        puts "6. Find a movie and view its website in your default browser"
        puts "7. See more options to run analytics"
        puts "Enter 'exit' to close the program."
        input = gets.chomp
        if input == "1"
            find_movie_by_title_and_display
        elsif input == "2"
            find_movie_by_imdb_id_and_display
        elsif input == "3"
            add_movie_to_favorites
        elsif input == "4"
            puts "Would you like the list to display all info or just titles?"
            puts "(Enter 'all' or 'titles')."
            input2 = gets.chomp
            if input2 == "all"
                display_curr_favorites
            elsif input2 == "titles"
                display_curr_favorites_titles_only
            else
                puts "Invalid input, please try again from the menu.".red
            end
        elsif input == "5"
            view_poster
        elsif input == "6"
            view_website
        elsif input == "7"
            temp = sub_menu
            if temp == "exit"
                puts "Goodbye!".red
                break
            end
        elsif input == "exit"
            puts "Goodbye!".red
        else
            puts "Invalid input please try again!".red
        end
    end
end

#CONSOLE------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------
puts "Welcome to the OMDb command line interface application!"
find_or_create_user_by_username

main_menu