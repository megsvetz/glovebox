class WelcomesController < ApplicationController
  def home
    @contact = Contact.new
  end

  def contact
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash[:notice] = 'Thank you for your message. We appreciate the feedback!'
      redirect_to root_path
    else
      flash[:error] = 'Cannot send message.'
      redirect_to root_path
    end
  end
end
