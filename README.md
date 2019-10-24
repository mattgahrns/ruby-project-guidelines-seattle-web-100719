# OMDb Command Line Application - Matt Gahrns

Welcome to my project. The purpose of this application is to be able to quickly look up movies and receive IMDb info about them.
You can also save movies to a list of favorites that you can view. These are only two small features of the app, but are the base.

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

## Instructions

1. Fork and clone this repository.
2. Build your application. Make sure to commit early and commit often. Commit messages should be meaningful (clearly describe what you're doing in the commit) and accurate (there should be nothing in the commit that doesn't match the description in the commit message). Good rule of thumb is to commit every 3-7 mins of actual coding time. Most of your commits should have under 15 lines of code and a 2 line commit is perfectly acceptable.
3. Make sure to create a good README.md with a short description, install instructions, a contributors guide and a link to the license for your code.
4. Make sure your project checks off each of the above requirements.
5. Prepare a video demo (narration helps!) describing how a user would interact with your working project.
    * The video should:
      - Have an overview of your project.(2 minutes max)
6. Prepare a presentation to follow your video.(3 minutes max)
    * Your presentation should:
      - Describe something you struggled to build, and show us how you ultimately implemented it in your code.
      - Discuss 3 things you learned in the process of working on this project.
      - Address, if anything, what you would change or add to what you have today?
      - Present any code you would like to highlight.   
7. *OPTIONAL, BUT RECOMMENDED*: Write a blog post about the project and process.

---

