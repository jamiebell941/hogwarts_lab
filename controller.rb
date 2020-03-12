require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('models/house')
require_relative('models/student')
also_reload('./models/*')

get '/students' do
  @students = Student.all
  @houses = House.all
  erb(:student_index)
end

get '/students/new' do
  @houses = House.all
  erb(:student_new)
end

post '/students' do
    @student = Student.new(params)
    @student.save
    erb(:student_create)
end

get '/houses' do
  @houses = House.all
  erb(:house_index)
end
