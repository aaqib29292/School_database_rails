class KlassesController < ApplicationController

  def index
    @klasses = Klass.all

    #instantiate new object
    @new_klass = Klass.new

    #section new in present at index of klass
    @new_section = Section.new
  end

  def create
    #instantiate new object
    @klass = Klass.new
    @klass.name = params[:klass][:name]

    #save the new object
    @save_success = @klass.save # .save returns true or false
    if @klass.save
    else
    end
  end
end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # The priority is based upon order of creKlassesation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
