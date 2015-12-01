class SessionsController < ApplicationController
  def new
  end

  def create
      user = Usuario.find_by(usuario: params[:session][:usuario].downcase)
      if user && user.authenticate(params[:session][:senha])
        # Log the user in and redirect to the user's show page.
        log_in usuario
      redirect_to usuario

      else
        flash[:danger] = 'Combinação inválida de Login/Senha'
        render 'new'
      end
  end
  def destroy
  end

end
 
