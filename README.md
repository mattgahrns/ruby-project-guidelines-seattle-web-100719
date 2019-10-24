# OMDb Command Line Application - Matt Gahrns

Welcome to my project. The purpose of this application is to be able to quickly look up movies and receive IMDb info about them from the OMDb API.
You can also save movies to a list of favorites that you can view. These are only two small features of the app, but are the backbone of it.

## Schema

### User

```ruby
  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
  end
```

### Movie

```ruby
  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "year"
    t.string "rated"
    t.string "released"
    t.string "runtime"
    t.string "genre"
    t.string "director"
    t.string "writer"
    t.string "actors"
    t.string "plot"
    t.string "language"
    t.string "country"
    t.string "awards"
    t.string "poster"
    t.string "metascore"
    t.string "imdbrating"
    t.string "imdbvotes"
    t.string "imdbid"
    t.string "dvd"
    t.string "boxoffice"
    t.string "production"
    t.string "website"
  end
```

### Favorite

```ruby
  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "movie_id"
  end
```

## User Stories
1. As a user, I want to be able to save to and retrieve a list of my favorite movies.
2. As a user, I want to search for a movie by title or
IMDb id to quickly get IMDb information about that movie.
3. As a user, I should be able to see all the movies that have been favorited by all the users.
4. As a user, I want to be able to search my favorites
by IMDb star rating and box office earnings.

## Install Instructions

1. Fork and clone this repository.
2. Open the repository in your IDE of choice.
3. Run ```bundle install``` in console to insure you have all the required gems.
4. Run ```rake db:migrate``` in console to create the schema.
5. Run ```ruby bin/run.rb``` in the console to start the application.

## Contributors Guide

If you wish to conribute to the project you may do so by following the proceeding steps:
1. Follow steps one and two of the *Install Instructions* section.
2. Create your own branch to work on.
3. Follow standard Ruby convention in your code.
4. Submit any changes you've made to your branch as a pull request on the master to be reviewed.

## License

[MIT License](https://opensource.org/licenses/MIT)

### Copyright 2019 Matt Gahrns

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.







---

