class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  configure do 
    set :views, 'app/views'
  end
  # in application_controller.rb
  get '/' do
    #erb :welcome
  end

  #get detail of all posts
  get "/posts" do
    @posts = Post.all.to_json

  
  
  
  end

  #Get details of all authors
  get "/authors" do
    @authors = Author.all.to_json
  
  end

  #Get details of all categories
  get "/categories" do
    @categories = Category.all.to_json
  end

  #Get a specific posts
  get '/posts/:id' do
    @post = Post.find(params[:id]).to_json

  end

  #Get a specific author
  get '/authors/:id' do
    @author = Author.find(params[:id]).to_json

  end

  #Get a specific category
  get '/categories/:id' do
    @category = Category.find(params[:id]).to_json

  end

  #user creates a new post
  post '/posts' do
    title = params[:title]
    content = params[:content]
    @post = Post.create(title: title, content: content).to_json
  end

  #New author is created
  post '/authors' do
    name = params[:name]
    email = params[:email]
    password = params[:password]
    @author = Author.create(name: name, email: email, password: password)
    

  end
  #updates a specific author
  patch '/authors/:id' do
    @author = Author.find_by(id:params[:id])
    @author.update(name: params[:name], email: params[:email], password: params[:password])
    redirect '/authors'
  end
  #updates a specific post
  patch '/posts/:id' do
    @post = Post.find_by(id:params[:id])
    @post.update(title: params[:title], content:params[:content])
    redirect '/posts'
  end
  #Deletes a specific post
  delete '/posts/:id' do
    @post = Post.find_by(id:params[:id])
    @post.destroy
    redirect '/posts'

  end
  #Deletes a specific author
  delete '/authors/:id' do
    @author = Author.find_by(id:params[:id])
    @author.destroy
    redirect '/authors'

  end

  

end
