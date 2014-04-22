class FoodsController < ApplicationController
  before_filter :find_pub
  before_filter :find_food, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @food = @pub.foods.new
  end

  def create
    @food = @pub.foods.new food_params
    if @food.save
      redirect_to pub_path(@pub)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @food.update_attributes food_params
    redirect_to pub_path(@pub)
  end

  def destroy
    @food.delete
    redirect_to pub_path(@pub)
  end
private
  def find_pub
    @pub = Pub.find params[:pub_id]
  end

  def find_food
    @food = @pub.foods.find params[:id]
  end

  def food_params
    params.require(:food).permit(:name, :description, :cost)
  end

end
