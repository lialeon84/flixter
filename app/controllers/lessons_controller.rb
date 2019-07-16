class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_enrollment_for_current_lesson

  def show
  end

  #def enroll
    #@lesson = current_user.enroll_in(lesson_params)
    #redirect_to instructor_course_path(current_lesson.course)
 #end

 private

  def require_enrollment_for_current_lesson
    if !current_user.enrolled_in?(current_lesson.section.course)
      redirect_to course_path(current_lesson.section.course), alert: "you must enroll"
    end
  end


   

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
