require 'sinatra/base'
require 'rack-flash'

class SongsController < ApplicationController
    enable :sessions
    use Rack::Flash
    
    get '/songs' do
        @songs = Song.all 
        erb :'songs/index'
    end

    get '/songs/new' do
        @genres = Genre.all 
        erb :'songs/new'
    end

    post '/songs' do
        
        @song = Song.create(:name => params[:song][:name])
        @song.artist = Artist.find_or_create_by(:name => params[:song][:artist])
        @song.genre_ids = params[:song][:genres]
        
        @song.save
        slug = "/songs/#{@song.slug}"
        flash[:notice] = "Successfully created song."
        redirect to slug
        
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])

        @artist = params[:song][:artist]
        @genres = params[:song][:genres]
        @song.name = params[:song][:name]
        @song.artist = Artist.find_or_create_by(:name => params[:song][:artist])
                
        @song.genres.clear
        @genres.each do |genre|
            @song.genres << Genre.find(genre)
        end

        @song.save
        
        slug = "/songs/#{@song.slug}"
        flash[:notice] = "Successfully updated song."
        redirect to slug
        

    end

    get '/songs/:slug/edit' do
        @genres = Genre.all
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/edit'
        
    end

    
end