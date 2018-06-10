# Controller

require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :index
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps/new' do
    peep = params['peep']
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
    redirect '/peeps'
  end

  run! if app_file == $0
end
