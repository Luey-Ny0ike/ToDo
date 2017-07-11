require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/todo')
require('pg')

DB = PG.connect(dbname: 'to_do')

get('/') do
  @tasks = Task.all
  erb(:index)
end

post('/task') do
  description = params.fetch('description')
  task = Task.new(description)
  task.save
  erb(:success)
end
