require_relative '../config/environment'


currUser = nil

def find_or_create_user_by_username
    puts "To start enter your username or create one and press enter to sign up:"
    username = gets.chomp
    User.all.each do |user|
        if user.username == username
            currUser = user
        else
            currUser = User.create(username: username)
        end
    end
end

#puts "HELLO WORLD"
