class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      #redirect_to catalog_index_path
      # Log the user in and redirect to the user's show page.
      redirect_back_or catalog_index_path
    else
      flash.now[:danger] = 'Nieprawidłowe hasło bądź email'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
