
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts/posts' do
    puts "we got here"
    new_post = Post.create(name: params[:name], content: params[:content])
    puts "here?"
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(id: params[:id])
    erb :show
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end
end
