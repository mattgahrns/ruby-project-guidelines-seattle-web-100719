require 'httparty'

responses = []
urls = []


urls.each do |url|
    response = HTTParty.get(url)
    responses << response.parsed_response
end

responses.each do |response|
    title = response["Title"]
    year = response["Year"]
    rated = response["Rated"]
    released = response["Released"]
    runtime = response["Runtime"]
    genre = response["Genre"]
    director = response["Director"]
    writer = response["Writer"]
    actors = response["Actors"]
    plot = response["Plot"]
    language = response["Language"]
    country = response["Country"]
    awards = response["Awards"]
    poster = response["Poster"]
    metascore = response["Metascore"]
    imdbrating = response["imdbRating"]
    imdbvotes = response["imdbVotes"]
    imdbid = response["imdbID"]
    type = response["Type"]
    dvd = response["DVD"]
    boxoffice = response["BoxOffice"]
    production = response["Production"]
    website = response["Website"]



end