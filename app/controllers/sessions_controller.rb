class SessionsController < ApplicationController
  def new
  end

  def create
    user = logged_user(session_params)
    if user
      session[:user_id] = user.id
      redirect_to root_path
      flash[:success] = <<-eos
        Welcome to forsythia! Ready to
        #{view_context.link_to('work', '/start', class: 'text-strong')}?"
      eos
    else
      redirect_to '/login'
      flash[:error] = "Sorry, but your email or password were wrong."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

  def logged_user(session_params)
    user = User.find_by_email(session_params[:email])
    return user if user && user.authenticate(session_params[:password])
    nil
  end
end
