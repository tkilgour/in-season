class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = Order.all.where(user_id: params[:user_id])
    @farmers_farm = Farm.where(user_id: params[:user_id])[0]
    # @farmer_orders = Order.all.where(farm_id: @farmers_farm[:id])
  end

  def create
    charge = perform_stripe_charge
    order  = create_order(charge)

    if order.valid?
      empty_cart!
      redirect_to farm_order_path(order.farm_id, order.id), notice: 'Your Order has been placed.'
    else
      redirect_to farm_cart_path, error: order.errors.full_messages.first
    end

  rescue Stripe::CardError => e
    redirect_to cart_path, error: e.message
  end

  private

  def empty_cart!
    update_cart({})
  end

  def perform_stripe_charge
    Stripe::Charge.create(
      source:      params[:stripeToken],
      amount:      cart_total, # in cents
      description: "CSA order",
      currency:    'cad'
    )
  end

  def create_order(stripe_charge)
    order = Order.new(
      farm_id: params[:farm_id],
      user_id: current_user.id,
      # email: params[:stripeEmail],
      total_price: cart_total,
      stripe_charge_id: stripe_charge.id # returned by stripe
    )
    cart.each do |box_id, details|
      if box = Box.find_by(id: box_id)
        quantity = details['quantity'].to_i
        order.order_items.new(
          box: box,
          quantity: quantity,
          item_price: box.price,
          total_price: box.price * quantity
        )
      end
    end
    order.save!
    order
  end

  # returns total in cents not dollars (stripe uses cents as well)
  def cart_total
    total = 0
    cart.each do |box_id, details|
      if p = Box.find_by(id: box_id)
        total += p.price * details['quantity'].to_i
      end
    end
    total
  end

end
