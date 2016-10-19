require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza') 


# --- INDEX --- Get list of Pizzas -------
get '/pizzas' do
  @pizzas = Pizza.all()
  erb ( :index )
end

# --- NEW --- Get new pizza order ------
get '/pizzas/new' do 
  erb( :new )
end

# --- CREATE --- Create pizza order output ------ 
post '/pizzas' do 
  @pizza = Pizza.new( params )
  @pizza.save() 
  erb( :create )
end

# --- SHOW --- Get an individual pizza order by :id ----
get '/pizzas/:id' do
  @pizza = Pizza.find(params[:id])
  #binding.pry
  erb( :show )
end

# --- EDIT --- Get and edit pizza order by :id -------
get '/pizzas/:id/edit' do
  @pizza = Pizza.find(params[:id])
  erb(:edit)
end

# --- UPDATE --- update a pizza order by id ----------
put '/pizzas/:id' do
  @pizza = Pizza.update(params)
  # redirect to the show page 
  redirect to("/pizzas/#{params[:id]}")
end

# --- DESTROY --- delete a pizza order ---------------
delete '/pizzas/:id' do
 Pizza.destroy(params[:id])
 redirect to("/pizzas")
end











