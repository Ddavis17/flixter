class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :before_authorized_for_current_lesson.section.course, only: [:show]

  def show

  end

  private

  def before_authorized_for_current_lesson
    if current_lesson.user != current_user
      redirect_to course_path, alert: 'Enroll In This Course Before Watching Lessons'
      render plain: 'unauthorized', status: :unauthorized
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
