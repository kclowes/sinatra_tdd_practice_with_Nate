require 'sinatra/base'

class App < Sinatra::Application
  TASK_ARR = []
  get '/' do
    erb :index
  end

  get '/task/new' do
    erb :new_task
  end

  post '/' do
    TASK_ARR << params[:new_task]
    redirect '/'
  end
end