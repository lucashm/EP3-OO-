class ProdutosController < ApplicationController
	def index
        @produto = Produto.all
    end
		def new
	    @produto = Produto.new
	  end

		def create
  @produto = Produto.new(produto_params)
	if @produto.save
		flash.now[:success] = "Produto criado!"
		redirect_to produtos_path
	else
		render 'new'
	end
	end

	def produto_params
		params.require(:produto).permit(:nome, :descricao, :preco, :quantidade)
	end
	 def destroy
    id = params[:id]
    Produto.destroy id
    redirect_to root_url
end
end
