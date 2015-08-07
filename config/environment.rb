require 'bundler'
Bundler.require

require './app/models/cat'
require './app/models/meow'
require './app/models/like'
require './app/models/follow'


configure :development do
  set :database, "sqlite3:db/database.db"
end
