class CreateMovies < ActiveRecord::Migration[4.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :rated
      t.string :released
      t.string :runtime
      t.string :genre
      t.string :director
      t.string :writer
      t.string :actors
      t.string :plot
      t.string :language
      t.string :country
      t.string :awards
      t.string :poster
      t.string :metascore
      t.string :imdbrating
      t.string :imdbvotes
      t.string :imdbid
      t.string :dvd
      t.string :boxoffice
      t.string :production
      t.string :website
    end
  end
end
