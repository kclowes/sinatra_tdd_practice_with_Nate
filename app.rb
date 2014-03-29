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

  get '/task/:id' do
    erb :show_task, locals: {:id => params[:id].to_i}
  end

end