
class Student

  attr_accessor :student_id, :first_name, :last_name 
  attr_accessor :city, :state, :email, :gender, :pounds 
  attr_accessor :gpa, :taking_courses

  # (using block initializer)
  def initialize
    yield self if block_given?
  end

  def to_s
    @course_str = "\nCourses: #{taking_courses}" unless taking_courses.empty? 
    "Name: #{first_name} #{last_name} (#{gender} from #{city}, #{state}, weight: #{pounds}, GPA: #{gpa}) #{@course_str}"
  end

  def eql?(another) 
    student_id.eql?(another.student_id)
  end

  def hash
    student_id.hash
  end

end
