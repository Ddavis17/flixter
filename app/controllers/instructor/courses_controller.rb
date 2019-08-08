class Instructor::CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :before_authorized_for_current_course, only: [:show]

  def new
   @course = Course.new 
  end

  def create 
    if @course.valid?
     redirect_to instructor_course_path(@course)
    else
      render :new, status: :unprocessable_entity
   end
  end

  def show
  end

  private

  def before_authorized_for_current_course
    if current_course.user != current_user
      render plain: 'unauthorized', status: :unauthorized
    end
  end

  helper_method :current_course
  def current_course
    @current_course ||= Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :cost)
  end
end
