require('pry')

require_relative('../models/house.rb')
require_relative('../models/student.rb')

Student.delete_all
House.delete_all

house1 = House.new({"name" => "Gryffindor", "logo_url" => "https://i.imgur.com/jnHkdOy.gif"})
house2 = House.new({"name" => "Ravenclaw", "logo_url" => "https://i.imgur.com/tpBdVgT.gif"})
house3 = House.new({"name" => "Slytherin", "logo_url" => "https://i.imgur.com/NGKcOK5.gif"})
house4 = House.new({"name" => "Hufflepuff", "logo_url" => "https://i.imgur.com/cV2E3T0.gif"})
house1.save
house2.save
house3.save
house4.save

student1 = Student.new({"first_name" => "Harry", "last_name" => "Potter", "house_id" => house1.id, "age" => 16})
student2 = Student.new({"first_name" => "John", "last_name" => "Smith", "house_id" => house2.id, "age" => 14})
student3 = Student.new({"first_name" => "Tom", "last_name" => "Riddle", "house_id" => house3.id, "age" => 18})
student4 = Student.new({"first_name" => "Caron", "last_name" => "Jones", "house_id" => house4.id, "age" => 17})
student1.save
student2.save
student3.save
student4.save

binding.pry
nil
