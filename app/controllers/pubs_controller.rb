class PubsController < ApplicationController
  before_filter :find_pub, only: [:show, :edit, :update, :destroy]

  def new
    @pub = Pub.new
  end

  def create
    @pub = Pub.create pub_params
    redirect_to root_path
  end

  def show
    @drinks = @pub.drinks
    @foods = @pub.foods
  end

  def edit
  end

  def update
    @pub.update_attributes pub_params
    redirect_to root_path
  end

  def destroy
    @pub.delete
    redirect_to root_path
  end

private
  def find_pub
    @pub = Pub.find params[:id]
  end

  def pub_params
    params.require(:pub).permit(:name, :description, :phone_number, :location, :drinks_attributes)
  end
end
