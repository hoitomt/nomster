class PlacesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :fetch_place, only: [:edit, :update, :destroy]

  def index
    @places = Place.paginate(page: params[:page], per_page: 3)
  end

  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.create(place_params)
    if @place.valid?
      redirect_to places_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @place = Place.find(params[:id])
    @comment = Comment.new
  end

  def edit
  end

  def update
    @place.update_attributes(place_params)
    if @place.valid?
      redirect_to places_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @place.destroy
    redirect_to places_path
  end

  private

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end

  def fetch_place
    @place = Place.find(params[:id])
    if @place.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end
  end
end
