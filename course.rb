
class Course

  attr_accessor :course_name, :course_id 

  def initialize(name, id)
    @course_name, @course_id  = name, id
  end

  def to_s
    "#{course_name}: #{course_id}"
  end

end
