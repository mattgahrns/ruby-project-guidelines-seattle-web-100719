require_relative '../config/environment'

#curr stands for current. i.e. currUser = current user. curr used at the begining of a method name means 
#that method only works with the current user's favorites.

$currUser = nil

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
    system "clear"
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
    system "clear"
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
        system "clear"
        "Movie added to favorites!".green
    elsif input == "title" || input == "Title"
        movie = create_movie_by_title
        Favorite.create(user_id: $currUser.id, movie_id: movie.id)
        system "clear"
        puts "Movie added to favorites!".green
    else
        system "clear"
        puts "Invalid input please try again from the menu.".red
    end
end

def display_movie(movie)
    puts ""
    puts "Title: #{movie.title}".green
    puts "Year: #{movie.year}".green
    puts "Rated: #{movie.rated}".green
    puts "Released: #{movie.released}".green
    puts "Runtime: #{movie.runtime}".green
    puts "Genre: #{movie.genre}".green
    puts "Director: #{movie.director}".green
    puts "Writer: #{movie.writer}".green
    puts "Stars: #{movie.actors}".green
    puts "Plot: #{movie.plot}".green
    puts "Langauge: #{movie.language}".green
    puts "Country: #{movie.country}".green
    puts "Awards: #{movie.awards}".green
    puts "Poster: #{movie.poster}".green
    puts "Metascore: #{movie.metascore}".green
    puts "IMDb rating: #{movie.imdbrating}".green
    puts "IMDb votes: #{movie.imdbvotes}".green
    puts "IMDb id: #{movie.imdbid}".green
    puts "DVD released: #{movie.dvd}".green
    puts "Box office earnings: #{movie.boxoffice}".green
    puts "Production: #{movie.production}".green
    puts "Website: #{movie.website}".green
end

def display_movie_with_id(movie)
    puts "Title: #{movie.title}".green
    puts "Year: #{movie.year}".green
    puts "Rated: #{movie.rated}".green
    puts "Released: #{movie.released}".green
    puts "Runtime: #{movie.runtime}".green
    puts "Genre: #{movie.genre}".green
    puts "Director: #{movie.director}".green
    puts "Writer: #{movie.writer}".green
    puts "Stars: #{movie.actors}".green
    puts "Plot: #{movie.plot}".green
    puts "Langauge: #{movie.language}".green
    puts "Country: #{movie.country}".green
    puts "Awards: #{movie.awards}".green
    puts "Poster: #{movie.poster}".green
    puts "Metascore: #{movie.metascore}".green
    puts "IMDb rating: #{movie.imdbrating}".green
    puts "IMDb votes: #{movie.imdbvotes}".green
    puts "IMDb id: #{movie.imdbid}".green
    puts "DVD released: #{movie.dvd}".green
    puts "Box office earnings: #{movie.boxoffice}".green
    puts "Production: #{movie.production}".green
    puts "Website: #{movie.website}".green
    puts "ID: #{movie.id}".green
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
    system "clear"
    puts ""
    puts "#{$currUser.username}'s favorites:".green
    if Favorite.where("user_id = ?", $currUser.id) == []
        puts "You have no favorites. To add favorites enter '3' at the main menu.".red
    end
    Favorite.where("user_id = ?", $currUser.id).each do |fav|
        Movie.where("id = ?", fav.movie_id).each do |movie|
            count += 1
            puts "#{count}) ~~~~~~~~~~~~".colorize(:color => :black, :background => :green)
            display_movie_with_id(movie)
            puts ""
        end
    end
end

def display_curr_favorites_titles_only
    count = 0
    system "clear"
    puts ""
    puts "#{$currUser.username}'s favorites (titles only):".green
    if Favorite.where("user_id = ?", $currUser.id) == []
        puts "You have no favorites. To add favorites enter '3' at the main menu.".red
    end
    Favorite.where("user_id = ?", $currUser.id).each do |fav|
        Movie.where("id = ?", fav.movie_id).each do |movie|
            count += 1
            puts "#{count}) ~~~~~~~~~~~~".colorize(:color => :black, :background => :green)
            puts movie.title.green
            puts ""
        end
    end
end

def view_poster
    system "clear"
    puts "Which movie poster would you like to see?"
    movie = find_movie_by_title
    if movie.poster == "N/A"
        puts "Sorry this movie does not have a poster on IMDb"
    else
        Launchy.open(movie.poster)
        puts "Opening...".cyan
    end
end

def view_website
    system "clear"
    puts "Which movie website would you like to see?"
    movie = find_movie_by_title
    if movie.website == "N/A"
        puts "Sorry this movie does not have a website listed on IMDb"
    else
        Launchy.open(movie.website)
        puts "Opening...".cyan
    end
end

def curr_over_one_hundred_million_box_office
    res = curr_favorites
    res.delete_if{|movie| movie.boxoffice == "N/A"}
    res.delete_if{|movie| movie.boxoffice.split(/[$,]+/).join.to_i < 100000000}
    count = 0
    system "clear"
    puts "#{$currUser.username}'s favorite movies with over $100 million box office earnings:".green
    if res.empty?
        puts "No favorites earned over $100 million.".red
    else
        res.each do |movie|
            count += 1
            puts "#{count}) ~~~~~~~~~~~".colorize(:color => :black, :background => :green)
            puts movie.title.green
            puts movie.boxoffice.green
        end
    end
end

def curr_over_n_star_imdb_rating(n)
    res = curr_favorites
    res.delete_if{|movie| movie.imdbrating.to_f < n}
    count = 0
    system "clear"
    puts "#{$currUser.username}'s favorite movies with over #{n} stars on IMDb:".green
    if res.empty?
        puts "No favorites have over #{n} stars.".red
    else
        res.each do |movie|
            count += 1
            puts "#{count}) ~~~~~~~~~~~".colorize(:color => :black, :background => :green)
            puts movie.title.green
            puts movie.imdbrating.green
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
    system "clear"
    Movie.where("id = ?", movie_id).each do |movie|
        puts "The most popular (favorited) movie is:".green
        puts movie.title.green
    end
end

def movie_with_most_star_ratings
    max = 0
    max_movie = nil
    res = Movie.all
    system "clear"
    res.each do |movie| 
        if movie.imdbvotes.split(/[,]+/).join.to_i > max
            max = movie.imdbvotes.split(/[,]+/).join.to_i
            max_movie = movie
        end
    end
    puts "The movie with the most IMDb star ratings is:".green
    puts "#{max_movie.title} with #{max_movie.imdbvotes} votes!".green
end

def change_username
    system "clear"
    if confirm_password
        puts "Please enter your new username:".cyan
        username = gets.chomp
        User.update($currUser.id, :username => username)
        $currUser.username = username
        puts "Username change successful!".green
    else
        puts "Too many log in attempts, signing out...".red
        return "exit"
    end
end

def change_password
    system "clear"
    if confirm_password
        puts "Please enter your new password:".cyan
        password = STDIN.noecho(&:gets).chomp
        puts "Confirm password:".cyan
        password_confirm = STDIN.noecho(&:gets).chomp
        while password != password_confirm do
            puts "Password does not match, please try again:".red
            password_confirm = STDIN.noecho(&:gets).chomp
        end
        User.update($currUser.id, :password => password)
        puts "Password change successful!".green
    else
        puts "Too many log in attempts, signing out...".red
        return "exit"
    end
end

def clear_favorite
    system "clear"
    temp_movie = nil
    if confirm_password
        puts "Enter title of movie you wish to unfavorite:".cyan
        input = gets.chomp
        if Movie.find_by(title: input)
            temp_movie = Movie.find_by(title: input)
            temp_favorite = Favorite.find_by(movie_id: temp_movie.id)
            Favorite.delete(temp_favorite.id)
            puts "Your favorites list has been deleted".green
            if Favorite.where(movie_id: temp_movie.id) ==  []
                Movie.delete(temp_movie.id)
            end
        else
            puts "Unable to find that movie in your favorites!".red
        end
    else
        puts "Too many log in attempts, signing out...".red
        return "exit"
    end
end

def clear_all_favorites
    system "clear"
    if confirm_password
        puts "Are you sure you want to delete all your favorites? (yes/no):".cyan
        input = gets.chomp
        if input == "yes" || input == "Yes" || input == "y" || input == "Y"
            Favorite.where(user_id: $currUser.id).delete_all
            puts "Movie deleted from favorites".green
            Movie.all.each do |movie|
                if Favorite.where(movie_id: movie.id) ==  []
                    Movie.delete(movie.id)
                end
            end
        elsif input == "no" || input == "No" || input == "n" || input == "N"
            puts "Aborting...".red
        else
            puts "Invalid input, aborting... try again from menu.".red
        end
    else
        puts "Too many log in attempts, signing out...".red
        return "exit"
    end
end

def confirm_password
    puts "Enter your password to confirm identity:".cyan
    password = STDIN.noecho(&:gets).chomp
    if password == User.find_by(username: $currUser.username).password
        system "clear"
        return true
    else
        2.times do 
            puts "Invalid password! Please try again.".red
            password = STDIN.noecho(&:gets).chomp
            if password == User.find_by(username: $currUser.username).password
                system "clear"
                return true
            end
        end
        return false
    end
end

def find_or_create_user_by_username
    restart = false
    puts "To start enter your username or create one and press enter to sign up:".cyan
    username = gets.chomp
    if User.find_by(username: username) == nil
        puts "Welcome #{username}! Now please enter a new password:".cyan
        password = STDIN.noecho(&:gets).chomp
        puts "Confirm password:".cyan
        password_confirm = STDIN.noecho(&:gets).chomp
        while password != password_confirm do
            puts "Password does not match, please try again:".red
            password_confirm = STDIN.noecho(&:gets).chomp
        end
        User.create(username: username, password: password)
        $currUser = User.find_by(username: username)
    else
        puts "Please enter your password:".cyan
        password = STDIN.noecho(&:gets).chomp
        if password == User.find_by(username: username).password
            puts "Logging in...".cyan
            $currUser = User.find_by(username: username)
            puts "Welcome #{$currUser.username}! You are now signed in.".green
        else
            puts "Invalid password! Please try signing in again.".red
            find_or_create_user_by_username
        end
    end
end

def analytics_menu
    input = nil
    system "clear"
    while input != "back" do
        puts ""
        puts "ANALYTICS MENU".colorize(:color => :green, :background => :light_blue)
        puts "Hello #{$currUser.username}! Please chose a command from below and enter the corresponding number:".light_blue
        puts "1. Show your favorite movies that earned over $100 million at the box office".cyan
        puts "2. Show your favorite movies that have over n stars on IMDb".cyan
        puts "3. Show the most popular (favorited) movie overall".cyan
        puts "4. Show the movie with the most IMDb star ratings".cyan
        puts "Enter 'back' to return to main menu or 'exit' to close the program.".light_blue
        input = gets.chomp
        if input == "1"
            curr_over_one_hundred_million_box_office
        elsif input == "2"
            puts "Enter number of stars (1-10):".cyan
            input3 = gets.chomp
            check_if_num = input3.to_f.between?(1,10)
            while !check_if_num do
                puts "That is not a number between 1 and 10. Please try again:".red
                input3 = gets.chomp
                check_if_num = input3.to_f.between?(1,10)
            end
            curr_over_n_star_imdb_rating(input3.to_f)
        elsif input == "3"
            most_popular_movie
        elsif input == "4"
            movie_with_most_star_ratings
        elsif input == "back"
            puts "Returning to main menu...".cyan
        elsif input == "exit"
            return input
        else
            system "clear"
            puts "Invalid input please try again!".red
        end
    end
end

def account_menu
    input = nil
    system "clear"
    while input != "back" do
        puts ""
        puts "ACCOUNT MENU".colorize(:color => :green, :background => :light_blue)
        puts "Hello #{$currUser.username}! Please chose a command from below and enter the corresponding number:".light_blue
        puts "1. Change username".cyan
        puts "2. Change password".cyan
        puts "3. Remove a movie from your favorites".cyan
        puts "4. Remove ALL movies from your favorites".cyan
        puts "Enter 'back' to return to main menu or 'exit' to close the program.".light_blue
        input = gets.chomp
        if input == "1"
            if change_username == "exit"
                return "exit"
            end
        elsif input == "2"
            if change_password == "exit"
                return "exit"
            end
        elsif input == "3"
            if clear_favorite == "exit"
                return "exit"
            end
        elsif input == "4"
            if clear_all_favorites == "exit"
                return "exit"
            end
        elsif input == "back"
            puts "Returning to main menu...".cyan
        elsif input == "exit"
            return input
        else
            system "clear"
            puts "Invalid input please try again!".red
        end
    end
end

def main_menu
    input = nil
    while input != "exit" do
        puts ""
        puts " MENU ".colorize(:color => :green, :background => :light_blue)
        puts "Hello #{$currUser.username}! Please chose a command from below and enter the corresponding number:".light_blue
        puts "1. Find a movie by title".cyan
        puts "2. Find a movie by IMDb ID".cyan
        puts "3. Add a movie to your favorites".cyan
        puts "4. List your favorite movies".cyan
        puts "5. Find a movie and view its poster in your default browser".cyan
        puts "6. Find a movie and view its website in your default browser".cyan
        puts "7. To visit the ANALYTICS MENU".cyan
        puts "8. To visit the ACCOUNT MENU".cyan
        puts "Enter 'exit' to close the program.".light_blue
        input = gets.chomp
        if input == "1"
            find_movie_by_title_and_display
        elsif input == "2"
            find_movie_by_imdb_id_and_display
        elsif input == "3"
            add_movie_to_favorites
        elsif input == "4"
            puts "Would you like the list to display all info or just titles?".cyan
            puts "(Enter 'all' or 'titles')".cyan
            input2 = gets.chomp
            if input2 == "all"
                display_curr_favorites
            elsif input2 == "titles" || input2 == "title"
                display_curr_favorites_titles_only
            else
                system "clear"
                puts "Invalid input, please try again from the menu.".red
            end
        elsif input == "5"
            view_poster
        elsif input == "6"
            view_website
        elsif input == "7"
            temp = analytics_menu
            if temp == "exit"
                puts "Goodbye!".green
                break
            else
                system "clear"
            end
        elsif input == "8"
            temp = account_menu
            if temp == "exit"
                puts "Goodbye!".green
                break
            else
                system "clear"
            end
        elsif input == "exit"
            puts "Goodbye!".green
        else
            system "clear"
            puts "Invalid input please try again!".red
        end
    end
end

#CONSOLE------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------
system "clear"

puts "Welcome to the OMDb command line interface application!".cyan

find_or_create_user_by_username

main_menu