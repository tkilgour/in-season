class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def create
    charge = perform_stripe_charge
    order  = create_order(charge)

    if order.valid?
      empty_cart!
      redirect_to order, notice: 'Your Order has been placed.'
    else
      redirect_to cart_path, error: order.errors.full_messages.first
    end

  rescue Stripe::CardError => e
    redirect_to cart_path, error: e.message
  end

  private

  def empty_cart!
    # empty hash means no boxes in cart :)
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
      email: params[:stripeEmail],
      total_cents: cart_total,
      stripe_charge_id: stripe_charge.id, # returned by stripe
    )
    cart.each do |box_id, details|
      if box = Box.find_by(id: box_id)
        quantity = details['quantity'].to_i
        order.line_items.new(
          box: box,
          quantity: quantity,
          item_price: box.price,
          total_price: box.price * quantity
        )
      end
    end
    order.save!
      # OrderMailer.receipt_email(order).deliver_later if order.save
      # the mailer works on the local host, but stopped by program when using on the heroku deployment,
      # so I commented it out here
    order
  end

  # returns total in cents not dollars (stripe uses cents as well)
  def cart_total
    total = 0
    cart.each do |box_id, details|
      if p = Product.find_by(id: box_id)
        total += p.price_cents * details['quantity'].to_i
      end
    end
    total
  end

end
