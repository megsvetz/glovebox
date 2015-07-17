class ChargesController < ApplicationController
  before_action :check_membership
  def new
  end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    current_user.membership = 1
    current_user.upgrade_date = Date.today
    current_user.save

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

  private
  def check_membership
    redirect_to vehicles_path if current_user.premium?
  end
end
