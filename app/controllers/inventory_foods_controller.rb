class InventoryFoodsController < ApplicationController
  def destroy
    @inventory_food = InventoryFood.find_by(id: params[:food_id])

    if @inventory_food.destroy
      flash[:notice] = 'Inventory food deleted!'
    else
      flash[:alert] = 'Error! Please try again later.'
    end
    redirect_to inventory_path(params[:id])
  end

  def new
    @inventory = current_user.inventories.find(params[:id])
    @inventory_food = InventoryFood.new
  end

  def create
    food_list = params[:inventory_food][:food_list]
    food_list = food_list.drop(1)
    food_list.each do |food|
      quantity = Food.find(food.to_i).quantity
      new_inventory_food = InventoryFood.new(food_id: food.to_i, quantity: quantity, inventory_id: params[:id])
      new_inventory_food.save
    end
    redirect_to inventory_path(params[:id]), flash: { success: 'Inventory food has been added successfully' }
  end

  def inventory_food_params
    params.require(:inventory_food).permit(:food_list)
  end
end
