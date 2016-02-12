ENV['RACK_ENV'] ||= 'development'
# APP_ROOT = File.expand_path File.join(__dir__, "..")
# RACK_ENV = ENV['RACK_ENV']

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'tilt/erb'



class Bookmark < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb(:links)
  end

  get '/links/new' do
    erb(:new_link)
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    tag  = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end

  post '/tags/:name' do
    redirect "/tags/#{params[:filter_tag]}"
  end


   get '/tags/:name' do
     tag = Tag.first(name: params[:name])
     @links = tag ? tag.links : []
     erb :links
   end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
