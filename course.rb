
class Course

  attr_accessor :course_name, :course_id 

  def initialize(name, id)
    @course_name = name
    @course_id   = id
  end

  def to_s
  end
end
