require 'bundler'
Bundler.require
require './setup'

#functions
def view_tasks(tasks = nil)  
  erb(:view, {locals: {tasks: $tasks.find.to_a}})
end

get '/' do
  view_tasks
end

post '/add' do
  $tasks.insert({name: params[:task_name], description: params[:task_description]})  
  view_tasks
end

get '/delete' do
  $tasks.remove({name: params[:task_name]})
  view_tasks
end

puts "Server is now running."