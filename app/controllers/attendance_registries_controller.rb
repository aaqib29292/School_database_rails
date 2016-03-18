class AttendanceRegistriesController < ApplicationController

  before_action :fetch_klass_section

  def new
    @students_attendance = @section.students
  end

private
  def fetch_klass_section
    @klass = Klass.find(params[:klass_id])
    @section = @klass.sections.find(params[:section_id])
  end
end
