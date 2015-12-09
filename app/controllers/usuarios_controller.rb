class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  before_action :correct_user,   only: [:edit, :update]
  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
      @usuario = Usuario.find(params[:id])
    end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)
      if @usuario.save
        log_in @usuario
        flash.now[:success] = "Usuário criado!"
        redirect_to @usuario
      else
        render 'new'
      end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    @usuario = Usuario.find(params[:id])
    if @usuario.update_attributes(usuario_params)
      flash[:success] = "Profile updated"
      redirect_to @usuario
    else
      render 'edit'
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:usuario, :password, :password_confirmation)
    end
    def correct_user
          @usuario = Usuario.find(params[:id])
          redirect_to(root_url) unless @usuario == current_user
        end

end
