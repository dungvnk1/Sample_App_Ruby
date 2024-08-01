class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
<<<<<<< HEAD
      if user.activated?
        forwarding_url = session[:forwarding_url]
        reset_session
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        log_in user
        redirect_to forwarding_url || user
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
=======
      reset_session
      log_in user
      redirect_to user
>>>>>>> b26ad6c (Add gem config)
    else
      flash.now[:danger] = "Invalid email or password"
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
<<<<<<< HEAD
    log_out if logged_in?
    redirect_to root_url, status: :see_other
=======
>>>>>>> b26ad6c (Add gem config)
  end
end
