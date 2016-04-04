class KlassesController < ApplicationController

  def index
    @klasses = Klass.all.includes(students: [:house])

    #instantiate new object
    @new_klass = Klass.new

    respond_to do |format|
      format.html
      format.json { render :json => @klasses }
    end
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
