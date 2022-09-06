class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  configure do 
    set :views, 'app/views'
  end
  get "/" do
    erb :welcome_page
  end

end
