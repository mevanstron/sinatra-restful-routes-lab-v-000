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

  get '/recipes/new' do
    erb :new_recipe
  end

  post '/recipes' do
    recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    recipe.save
    redirect "/recipes/#{recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :recipe
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit_recipe
  end

  #post '/recipes/:id/edit' do
    #recipe = Recipe.find(params[:id])
    #recipe.name = params[:name]
    #recipe.ingredients = params[:ingredients]
  #  recipe.cook_time = params[:ingredients]
  #  redirect "/recipes/#{recipe.id}"
#  end

  post 'recipes/:id/delete' do
    recipe = Recipe.find(params[:id])
    recipe.clear if recipe
    redirect '/recipes'
  end
end
