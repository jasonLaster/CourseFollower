class User < ActiveRecord::Base
  belongs_to :course

  validate :course_must_exist

  def course_must_exist
      errors.add(:crn, "the course must exist") if
        Course.find_by_crn(crn).nil?
  end

  def course_available?
    if course.enrollment < course.limit
      "available"
    else
      "not available"
    end
  end
end
