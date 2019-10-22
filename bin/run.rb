require_relative '../config/environment'

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

def favorites
    Favorite.where("user_id = ?", $currUser.id)
end

def display_favorites
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

def over_fifty_million_box_office

end



puts "Welcom to the OMDb app!"
find_or_create_user_by_username

input = nil
while input != "exit" do
    puts ""
    puts "Please chose a command from below and enter the corresponding number:"
    puts "1. Find a movie by title"
    puts "2. Find a movie by IMDb ID"
    puts "3. Add a movie to your favorites"
    puts "4. List your favorite movies"
    puts "Type 'exit' to close the program."
    input = gets.chomp
    if input == "1"
        find_movie_by_title
    elsif input == "2"
        find_movie_by_imdb_id
    elsif input == "3"
        add_movie_to_favorites
    elsif input == "4"
        display_favorites
    elsif input == "exit"
        puts "Goodbye!"
    else
        puts "Invalid input please try again!"
    end
end