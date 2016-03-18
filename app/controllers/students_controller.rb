class StudentsController < ApplicationController

  before_action :fetch_klass_section
  def index
    @students = @section.students.includes(:house)
  end

  def new
    @student = @section.students.new
  end

  def create
    @student = @section.students.new(student_params)
    @save_success = @student.save
  end

  def show
    @student = @section.students.find(params[:id])
  end

  def edit
    @student = @section.students.find(params[:id])
  end

  def update
    @student = @section.students.find(params[:id])
    @save_success = @student.update_attributes(student_params)

  end
private
  def fetch_klass_section
    @klass = Klass.find(params[:klass_id])
    @section = @klass.sections.find(params[:section_id])
  end

  def student_params
    params.require(:student).permit(:name, :fathers_name, :gender, :email, :address, :phone, :dob, :house_id)
  end
end
