require 'sinatra/base'
require './lib/peep'
class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all
    erb :index
  end
  post '/peeps' do
    Peep.create(peep: params['peep'])
    redirect '/peeps'
  end
  run! if app_file == $0
end
