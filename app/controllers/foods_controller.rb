class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @foods = Food.all
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # POST /foods
  def create
    @food = Food.new(food_params)
    @food.user = current_user
    if @food.save
      flash[:success] = 'New inventory has been created !!'
      redirect_to foods_path
    else
      flash['alert'] = 'Inventory could not created !!'
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    flash[:success] = 'Inventory has been deleted successfully'
    redirect_to foods_path
  end

  private

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit!
  end
end
