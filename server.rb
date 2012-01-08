require 'sinatra'

set :environment, :production
set :public_folder, File.expand_path('public', File.dirname(__FILE__))
# Checks on static files before dispatching calls
enable :static

get "/" do
  erb :index
end

get "/ridelog/" do
  response.headers['Cache-Control'] = 'public, max-age=300'
  File.read(File.join(settings.public_folder, "/ridelog/index.html"))
end

get "/ridelog/:page/" do
  response.headers['Cache-Control'] = 'public, max-age=300'
  File.read(File.join(settings.public_folder, "ridelog", params[:page] + "/index.html"))
end

get "/:page" do
  response.headers['Cache-Control'] = 'public, max-age=300'
  File.read(File.join(settings.public_folder, params[:page] + "/index.html"))
end