class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson

  def show
  end

  def new
    @lesson = Lesson.new
  end

  def enroll
    @lesson = current_user.enroll_in(lesson_params)
    redirect_to instructor_course_path(current_lesson.course)
 end

 private

  def require_authorized_for_current_lesson
    if current_lesson.course.user != current_user
      return render plain: 'Must enroll', status: :unenrolled
    end
  end


   

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
