class CarsController < ApplicationController

  def index
  end

  def create
    if !params.has_key?(:make) || params[:make].strip.empty? ||
        !params.has_key?(:model_year) || params[:model_year].strip.empty?
        flash[:info] = "Information Missing!"
        redirect_to "/cars/index"
    else
      @make = params[:make]
      @model_year = params[:model_year]

      @car = Car.new(@make, @model_year)
      session[:car] = @car.to_yaml #this will save the car

      flash[:info] = "Your car has been created!"
      redirect_to "/cars/status"
    end
  end

  def status
    @car = YAML.load(session[:car])
  end

  def accelerate
    @car = YAML.load(session[:car])
    @car.accelerate
    session[:car] = @car.to_yaml
    redirect_to "/cars/status"
  end

  def brake
    @car = YAML.load(session[:car])
    @car.brake
    session[:car] = @car.to_yaml
    #need to figure out the if condition and make sure it runs correctly
    if @speed < 0
      @speed = 0
    end

    redirect_to "/cars/status"
  end

end
