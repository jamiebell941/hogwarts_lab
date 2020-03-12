require_relative('../db/sql_runner')

class Student

attr_reader :id, :house_id
attr_accessor :first_name, :last_name, :age

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id'].to_i
    @age = options['age']
  end

  def save()
    sql = "INSERT INTO students (first_name, last_name, house_id, age) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@first_name, @last_name, @house_id, @age]
    student = SqlRunner.run(sql, values).first
    @id = student['id'].to_i
   end

   def self.delete_all()
     sql = "DELETE FROM students;"
     SqlRunner.run(sql)
   end

   def self.all()
     sql = "SELECT * FROM students"
     students = SqlRunner.run(sql)
     result = students.map {|student| Student.new(student)}
     return result
   end

   def self.find_by_id(id)
      sql = "SELECT * FROM students WHERE id = $1"
      values =[id]
      student = SqlRunner.run(sql, values)
      result = Student.new( student.first )
      return result
   end

   def find_house()
     sql ="select houses.name from houses inner join students on houses.id = students.house_id where students.id = $1"
     values = [@id]
     house_name = SqlRunner.run(sql, values).first
     return house_name
   end

end
