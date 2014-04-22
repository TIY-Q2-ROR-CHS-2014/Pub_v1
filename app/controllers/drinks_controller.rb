class DrinksController < ApplicationController
  before_filter :find_pub
  before_filter :find_drink, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @drink = @pub.drinks.new
  end

  def create
    @drink = @pub.drinks.new drink_params
    if @drink.save
      redirect_to pub_path(@pub)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @drink.update_attributes drink_params.merge({in_edit: "inside_of_edit"})
    redirect_to pub_path(@pub)
  end

  def destroy
    @drink.delete
    redirect_to pub_path(@pub)
  end
private
  def find_pub
    @pub = Pub.find params[:pub_id]
  end

  def find_drink
    @drink = @pub.drinks.find params[:id]
  end

  def drink_params
    params.require(:drink).permit(:name, :description, :cost)
  end
end
