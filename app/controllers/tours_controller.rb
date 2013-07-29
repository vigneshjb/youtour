class ToursController < ApplicationController
  # GET /tours
  # GET /tours.json
  def index
    @user = User.find(params[:user_id])
    @tours = @user.tours

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tours }
    end
  end

  # GET /tours/1
  # GET /tours/1.json
  def show
    @user=User.find(params[:user_id])
    @tour = @user.tours.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tour }
    end
  end

  # GET /tours/new
  # GET /tours/new.json
  def new
    @user = User.find(params[:user_id])
    @tour = @user.tours.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tour }
    end
  end

  # GET /tours/1/edit
  def edit
    @tour = Tour.find(params[:id])
  end

  # POST /tours
  # POST /tours.json
  def create
    @user = User.find(params[:user_id])
    @tour = @user.tours.new(params[:tour])

    respond_to do |format|
      if @tour.save
        format.html { redirect_to user_tours_path, notice: 'Tour was successfully created.' }
        format.json { render json: @tour, status: :created, location: user_tours_path }
      else
        format.html { render action: "new" }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tours/1
  # PUT /tours/1.json
  def update
    @tour = Tour.find(params[:id])
    params[:tour][:user_id]=current_user.id

    respond_to do |format|
      if @tour.update_attributes(params[:tour])
        format.html { redirect_to user_tours_path, notice: 'Tour was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1
  # DELETE /tours/1.json
  def destroy
    @tour = Tour.find(params[:id])
    @tour.destroy

    respond_to do |format|
      format.html { redirect_to tours_url }
      format.json { head :no_content }
    end
  end
end
