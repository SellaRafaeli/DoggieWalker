Bundler.require
require './setup'

#functions
def view_tasks(tasks = nil)  
  erb :view, locals: {tasks: $tasks.find.to_a}
end

get '/' do
  view_tasks
end

post '/add' do
  $tasks.insert(name: params[:name], description: params[:description])  
  view_tasks
end

get '/delete' do
  $tasks.remove(name: params[:name])
  view_tasks
end