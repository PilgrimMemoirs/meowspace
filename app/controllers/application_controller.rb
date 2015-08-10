require 'bundler'
Bundler.require

require './config/environment.rb'
require 'pry'

class ApplicationController < Sinatra::Base


  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    enable :sessions
    set :session_secret, 'meowspace'
  end

  get '/' do
    erb :index
  end

  get '/cat/:id' do
    @cat = Cat.find(params[:id])
    erb :cat
  end

  post '/like' do
    liked = Like.new(cat_id: params[:user], meow_id: params[:meow])
    liked.save

    erb :index
  end

  get '/login' do
    erb :login
  end

  post '/sign-up' do
    @cat = Cat.new(:username => params[:username], 
      :first_name => params[:first_name], 
      :last_name => params[:last_name], 
      :password => params[:password])

    if @cat.save
      session[:user_id] = @cat
      @message = "successfully signed up"
    else
      @error = "Sign-up Failed"
    end

    erb :index
  end

  post '/login' do
    @cat = Cat.find(params[:id].to_i)

    if @cat
      session[:user_id] = @cat
    else
      @error = "Login Failed: Figure your stuff out"
    end

    erb :index
  end

  post '/logout' do 
    session[:user_id] = nil

    erb :index
  end 


  post '/meow' do
    @meow = Meow.new
    @meow.message = params[:message]
    @meow.cat_id = params[:cat]
    @meow.save

    erb :index
  end

  get '/user' do
    erb :user
  end


end