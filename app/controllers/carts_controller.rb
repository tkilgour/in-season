class CartsController < ApplicationController

  def show
    @box = Box.find(params[:box_id])

  end

  def add_item
    box_id = params[:box_id].to_s

    item = cart[box_id] || { "quantity" => 0 }
    item["quantity"] += 1
    cart[box_id] = item
    update_cart cart

    redirect_to :back
  end

  def remove_item
    box_id = params[:box_id].to_s

    item = cart[box_id] || { "quantity" => 1 }
    item["quantity"] -= 1
    cart[box_id] = item
    cart.delete(box_id) if item["quantity"] < 1
    update_cart cart

    redirect_to :back
  end

end
