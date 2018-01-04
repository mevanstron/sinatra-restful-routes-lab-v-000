class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    redirect '/recipes'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :recipe
  end

  get '/recipes/:id/edit' do
    erb :edit_recipe
  end

  post 'recipes/:id/delete' do
    recipe = Recipe.find(params[:id])
    recipe.clear if recipe
  end
end
