require 'sinatra/base'
require './app/models/link'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :index
  end

  get '/links/new' do
    erb :form

  end

  post '/links' do
    p params
    Link.create(url: params[:URL], title: params[:title])
    redirect '/links'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
