# Controller

require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base


  get '/users/new' do
    erb:"users/new"
  end

  post '/users' do
    User.create(email: params['email'], password: params['password'])
    redirect '/peeps'
  end


  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :index
  end

  post '/peeps' do
    Peep.create(peep: params['peep'])
    redirect '/peeps'
  end

  run! if app_file == $0
end
