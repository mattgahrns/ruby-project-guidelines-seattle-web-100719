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
    rated = 
    released = 
    runtime =
    genre =
    director =
    writer =
    actors =
    plot =
    language =
    country =
    awards =
    poster =
    metascore =
    imdbrating =
    imdbvotes =
    imdbid =
    type =
    dvd =
    boxoffice =
    production =
    website =



end