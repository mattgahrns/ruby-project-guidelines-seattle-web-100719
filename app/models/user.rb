class User < ActiveRecord::Base
    has_many :favorites
    has_many :movies, through: :favorites
end