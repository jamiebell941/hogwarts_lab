class House

  attr_reader :id
  attr_accessor :name, :logo_url

 def initialize(options)
   @id = options['id'].to_i if options['id']
   @name= options['name']
   @logo_url = options['logo_url']
 end

 def save()
   sql = "INSERT INTO houses (name, logo_url) VALUES ($1, $2) RETURNING id"
   values = [@name, @logo_url]
   house = SqlRunner.run(sql, values).first
   @id = house['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run(sql)
    result = houses.map {|house| House.new(house)}
    return result
  end

  def self.find_by_id(id)
     sql = "SELECT * FROM houses WHERE id = $1"
     values =[id]
     house = SqlRunner.run(sql, values)
     result = House.new( house.first )
     return result
  end

  def self.delete_all()
    sql = "DELETE FROM houses;"
    SqlRunner.run(sql)
  end

end
