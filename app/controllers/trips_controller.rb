class TripsController < ApplicationController
  # GET /trips
  # GET /trips.json
  def index
    @user = User.find(params[:user_id])
    @tour = @user.tours.find(params[:tour_id])
    @trips = @tour.trips.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trips }
    end
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @user = User.find(params[:user_id])
    @tour = @user.tours.find(params[:tour_id])
    @trip = @tour.trips.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/new
  # GET /trips/new.json
  def new
    @user = User.find(params[:user_id])
    @tour = @user.tours.find(params[:tour_id])
    @trip = @tour.trips.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/1/edit
  def edit
    @user = User.find(params[:user_id])
    @tour = @user.tours.find(params[:tour_id])
    @trip = @tour.trips.find(params[:id])
  end

  # POST /trips
  # POST /trips.json
  def create
    @user = User.find(params[:user_id])
    @tour = @user.tours.find(params[:tour_id])
    @trip = @tour.trips.new(params[:trip])

    respond_to do |format|
      if @trip.save
        format.html { redirect_to user_tour_trips_path, notice: 'Trip was successfully created.' }
        format.json { render json: @trip, status: :created, location: @trip }
      else
        format.html { render action: "new" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trips/1
  # PUT /trips/1.json
  def update
    @user = User.find(params[:user_id])
    @tour = @user.tours.find(params[:tour_id])
    @trip = @tour.trips.find(params[:id])

    respond_to do |format|
      if @trip.update_attributes(params[:trip])
        format.html { redirect_to user_tour_trip_path(@user,@tour,@trip), notice: 'Trip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @user = User.find(params[:user_id])
    @tour = @user.tours.find(params[:tour_id])
    @trip = @tour.trips.find(params[:id])
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to user_tour_trips_url }
      format.json { head :no_content }
    end
  end
end
