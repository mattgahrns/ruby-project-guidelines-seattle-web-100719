class Movie < ActiveRecord::Base
    has_many :favorites
    has_many :users, through: :favorites
end