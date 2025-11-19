class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    set_restaurant
  end

  def new
    @Restaurant = Restaurant.new
  end

  def create
  raise
  @restaurant = Restaurant.new(restaurant_params)
  @restaurant.save # Will raise ActiveModel::ForbiddenAttributesError
  end


  def edit
    set_restaurant
  end

  def update
    set_restaurant
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path
  end

  def destroy
    set_restaurant
    @restaurant.destroy
    redirect_to restaurant_path, status: :see_others
  end


private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
  def restaurant_params
  params.require(:restaurant).permit(:name, :address, :rating)
end
end
