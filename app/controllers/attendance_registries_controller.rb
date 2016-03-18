class AttendanceRegistriesController < ApplicationController

  before_action :fetch_klass_section

  skip_before_filter :verify_authenticity_token
  def new
    @students_attendance = @section.students
    @attendance_registry = @section.attendance_registries.new
  end

  def create
    debugger
    @attendance_registry = @section.attendance_registries.new
    @attendance_registry.date = Date.today
    @attendance_registry.absentee_ids = params[:attendance_registry][:absentee_ids].split(",").collect(&:to_i)
    @attendance_registry.save!
  end


private
  def fetch_klass_section
    @klass = Klass.find(params[:klass_id])
    @section = @klass.sections.find(params[:section_id])
  end
end
