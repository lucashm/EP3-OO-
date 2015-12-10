class SessionsController < ApplicationController

  def new
  end

  def create
    user = Usuario.find_by(usuario: params[:session][:usuario].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
    redirect_to user

    else
      flash.now[:danger] = 'Combinação de usuário/senha incorreta!' # Not quite right!
            render 'new'
    end
  end

  def destroy
    log_out if logged_in?
        redirect_to root_url
    end
end
