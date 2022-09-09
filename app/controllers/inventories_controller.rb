class InventoriesController < ApplicationController
  def index
    @user = current_user
    @inventories = @user.inventories
  end

  def show
    @user = current_user
    @inventory = @user.inventories.find(params[:id])
    @foods = @inventory.inventory_foods.includes(:food)
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(inventory_params)
    @inventory.user_id = current_user.id

    render :new unless @inventory.save

    redirect_to inventories_path
  end

  def destroy
    @inventory = Inventory.find_by(id: params[:id])

    if @inventory.destroy
      flash[:notice] = 'Inventory deleted!'
    else
      flash[:alert] = 'Error! Please try again later.'
    end
    redirect_to inventories_path
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :description)
  end
end
