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

  get '/task/:id/edit' do
    erb :edit_task, locals: {:id => params[:id].to_i}
  end

  put '/task/:id' do
    TASK_ARR[params[:id].to_i] = params[:edit_task]
    redirect '/'
  end

  delete '/task/:id' do
    TASK_ARR.delete_at(params[:id].to_i)
    redirect '/'
  end
end